import hashlib

class Test():
    def __init__( self, input, expected_output, id=None ):
        """
        params:
            input: json serializable input for the test
            expected_output: json serializable expected output for the test
            id: unique key for test. A unique test should have a unique id.
                autogenerated by finding the md5 of the input and output if no 
                id is specified
        """
        self.input = input
        self.expected_output = expected_output
        if id is None:
            hash = hashlib.md5()
            hash_string = str( input ) + str( expected_output )
            hash.update( hash_string.encode( 'utf-8' ) )
            id = hash.hexdigest()
        self.id = id

class TestSet():
    def __init__( self, tests, id=None ):
        self.tests = tests
        self.id = id if id is not None else 'default'
        self.algorithm = None

class TestOutput():
    def __init__( self, test, output ):
        self.test = test
        self.output = output
    
class TestResult():
    def __init__( self, test_output, result ):
        self.test_output = test_output
        self.result = result

        self.test = test_output.test

class TestSetResult():
    def __init__( self, test_set ):
        self.test_set = test_set
        self.test_results = []
        self.result = None        

    def addTestResult( self, test_result ):
        self.test_results.append( test_result )

    def setResult( self, result ):
        self.result = result

class Algorithm():
    def __init__( self, id='algorithm', description='No description', version='na', parameters={} ):
        self.id = id
        self.description = description
        self.version = version
        self.parameters = parameters

    def _run( self, input, parameters ):
        pass

    def run( self, test ):
        return TestOutput( test, self._run( test.input, self.parameters ) )

    def getVersion( self ):
        return self.version

    def getDescription( self ):
        return self.description

    def getParameters( self ) :
        return self.parameters

class TestSetResultHandler():
    def __init__( self, test_set ):
        self.test_set_result = TestSetResult( test_set )

    def addOutput( self, test_output ):
        self.test_set_result.addTestResult( self.handleTestOutput( test_output ) )

    def handleTestOutput( self, test_output ):
        """
            Map
        """
        return TestResult( test_output, {} )

    def calculateResults( self ):
        """
            Reduce
        """x
        return self.test_set_result

class BasicTestResultHandler( TestSetResultHandler ):
    def __init__( self, test_set ):
        super( BasicTestResultHandler, self).__init__( test_set )

        self.valid = 0

    def handleTestOutput( self, test_output ):
        return TestResult( test_output, {
            'valid': 1 if test_output.output == test_output.test.expected_output else 0
        } )

    def calculateResults( self ):
        valids = 0
        for test_result in self.test_set_result.test_results:
            valids += test_result.result[ 'valid' ]

        self.test_set_result.setResult( {
            'percent_correct': valids / len( self.test_set_result.test_results )
        } )

class TestSetGenerator():
    def generate( self ):
        return []

class OutputHandler():
    def handle( self, test_set_result ):
        pass

class LogHandler():
    def handle( self, test_set_result ):
        print( 'Individual tests: ' )
        for test_result in test_set_result.test_results:
            print( '\t', test_result.test.id, test_result.result )
        print( 'Test set:' )
        print( '\t', test_set_result.result )

test_set_generator = None
def testAlgorithm( 
        algorithm: Algorithm, 
        test_set_generator,
        test_set_result_handler_class = BasicTestResultHandler,
        output_handlers = [ LogHandler() ]
    ):
    """
    Uses the framework to test the given algorithm against the test set generated
    by the provided generator

    params:
        algorithm: An Algorithm that takes an input and responds with an output
        test_set_generator: Instance of TestSetGenerator that creates the test cases

        test_set_result_handler_class: subclass TestSetResultHandler, specifies how
            the results of the test runs will be compiled
        output_handlers: List of Instances of Subclasses of OutputHandler, each one
            will be passed the full results for storage / output
    """
    test_set = test_set_generator.generate()
    test_set.algorithm = algorithm
    test_set_result_handler = test_set_result_handler_class( test_set )

    for test in test_set.tests:
        test_output = algorithm.run( test )
        test_set_result_handler.addOutput( test_output )

    test_set_result_handler.calculateResults()

    for output_handler in output_handlers:
        output_handler.handle( test_set_result_handler.test_set_result )

if __name__ == '__main__':
    """
    Simple example of using this system to track the accuracy of an algorithm
    """
    import random

    class SometimesDoubleAlgorithm( Algorithm ):
        def __init__( self ):
            super( SometimesDoubleAlgorithm, self ).__init__();
            self.threshold = random.randint( 5, 8 )

        def _run( self, input ):
            if input < self.threshold:
                return input * 2
            return input

    class SequentialTestSetGenerator( TestSetGenerator ):
        def generate( self ):
            tests = []
            for i in range( 9 ):
                tests.append( Test( i, i*2, id=( 'test_' + str( i ) ) ) )
            return TestSet( tests )

    algorithm = SometimesDoubleAlgorithm()
    generator = SequentialTestSetGenerator()
    testAlgorithm( algorithm, generator )
