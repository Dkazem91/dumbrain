SQLite format 3   @                                                                     -�   �    ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	   	   � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              3	2018-09-03 16:09:57
   � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               3	2018-09-03 16:09:57   	� ���xV3��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                !	32018-09-03 16:09:57test_8816!32018-09-03 16:09:57test_7714!32018-09-03 16:09:57test_6612!32018-09-03 16:09:57test_5510 32018-09-03 16:09:57test_448 32018-09-03 16:09:57test_336 32018-09-03 16:09:57test_224 32018-09-03 16:09:57test_112 32018-09-03 16:09:57test_000
   	� ���������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
test_8	
test_7
test_6
test_5
test_4
test_3
test_2
test_1		test_0   � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               %3+2018-09-03 16:09:57SometimesDouble
   � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   +	SometimesDouble   � �`�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                N3 +1-2018-09-03 16:23:50SometimesDoubleDoubles sometimes?0.1{"threshold": 8}N3 +1-2018-09-03 16:23:49SometimesDoubleDoubles sometimes?0.1{"threshold": 7}N3 +1-2018-09-03 16:09:59SometimesDoubleDoubles sometimes?0.1{"threshold": 8}N3 +1-2018-09-03 16:09:57SometimesDoubleDoubles sometimes?0.1{"threshold": 7}�  �  ��� ���                                                                                                                                                                                                            �>!!�GtableAlgorithmsAlgorithmsCREATE TABLE Algorithms (
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                id VARCHAR( 200 ) PRIMARY KEY NOT NULL
            )3G! indexsqlite_autoindex_Algorithms_1Algorithms�z�StableTestsTestsCREATE TABLE Tests (
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                id VARCHAR( 200 ) PRIMARY KEY,
                input TEXT NOT NULL,
                expected_output TEXT NOT NULL
            ))= indexsqlite_autoindex_Tests_1Tests�8))�+tableMigrationsMetaMigrationsMetaCREATE TABLE MigrationsMeta (
        created_at DATETIME PRIMARY KEY DEFAULT CURRENT_TIMESTAMP,
        migration_level INTEGER NOT NULL
    );O) indexsqlite_autoindex_MigrationsMeta_1MigrationsMeta       �    ��                  �	))�?tableTestSetResultsTestSetResultsCREATE TABLE TestSetResults (
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

                test_set_id VARCHAR( 200 ) NOT NULL,
                results TEXT NOT NULL,

                algorithm_instance_id INTEGER NOT NULL,
                FOREIGN KEY( algorithm_instance_id ) REFERENCES AlgorithmInstances( id )
            )P++Ytablesqlite_sequencesqlite_sequenceCREATE TABLE sqlite_sequence(name,seq)�Q11�MtableAlgorithmInstancesAlgorithmInstancesCREATE TABLE AlgorithmInstances (
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                algorithm_id VARCHAR( 200 ) NOT NULL,

                description TEXT NOT NULL,
                version TEXT NOT NULL,
                parameters TEXT NOT NULL,

                FOREIGN KEY( algorithm_id ) REFERENCES Algorithms( id )
            )   5                                                    � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              1AlgorithmInstances   � �Y�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 R31[2018-09-03 16:23:501535991830.0178826{"percent_correct": 0.7777777777777778}R31[2018-09-03 16:23:491535991829.7249188{"percent_correct": 0.6666666666666666}R31[2018-09-03 16:09:591535990999.2484076{"percent_correct": 0.8888888888888888}Q31[	2018-09-03 16:09:571535990997.9812584{"percent_correct": 0.7777777777777778}   �    ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               U U                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           �(
##�tableTestResultsTestResultsCREATE TABLE TestResults (
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                test_id VARCHAR( 200 ) NOT NULL,
                test_set_id VARCHAR( 200 ),
                results TEXT NOT NULL,


                FOREIGN KEY( test_id ) REFERENCES Tests( test_id ),
                FOREIGN KEY( test_set_id ) REFERENCES TestSetResults( test_set_id )
            )    ^ ��F��N��V � � ^                                                        <31%2018-09-03 16:09:59test_51535990999.2484076{"valid": 1}<31%2018-09-03 16:09:59test_41535990999.2484076{"valid": 1}<31%2018-09-03 16:09:59test_31535990999.2484076{"valid": 1}<31%2018-09-03 16:09:59test_21535990999.2484076{"valid": 1}<31%2018-09-03 16:09:59test_11535990999.2484076{"valid": 1}<
31%2018-09-03 16:09:59test_01535990999.2484076{"valid": 1}<	31%2018-09-03 16:09:57test_81535990997.9812584{"valid": 0}<31%2018-09-03 16:09:57test_71535990997.9812584{"valid": 0}<31%2018-09-03 16:09:57test_61535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_51535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_41535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_31535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_21535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_11535990997.9812584{"valid": 1}<31%2018-09-03 16:09:57test_01535990997.9812584{"valid": 1}    ^ ��F��N��V � � ^                                                        <31%2018-09-03 16:23:50test_21535991830.0178826{"valid": 1}<31%2018-09-03 16:23:50test_11535991830.0178826{"valid": 1}<31%2018-09-03 16:23:50test_01535991830.0178826{"valid": 1}<31%2018-09-03 16:23:49test_81535991829.7249188{"valid": 0}<31%2018-09-03 16:23:49test_71535991829.7249188{"valid": 0}<31%2018-09-03 16:23:49test_61535991829.7249188{"valid": 0}<31%2018-09-03 16:23:49test_51535991829.7249188{"valid": 1}<31%2018-09-03 16:23:49test_41535991829.7249188{"valid": 1}<31%2018-09-03 16:23:49test_31535991829.7249188{"valid": 1}<31%2018-09-03 16:23:49test_21535991829.7249188{"valid": 1}<31%2018-09-03 16:23:49test_11535991829.7249188{"valid": 1}<31%2018-09-03 16:23:49test_01535991829.7249188{"valid": 1}<31%2018-09-03 16:09:59test_81535990999.2484076{"valid": 0}<31%2018-09-03 16:09:59test_71535990999.2484076{"valid": 1}<31%2018-09-03 16:09:59test_61535990999.2484076{"valid": 1}   � ��F��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <$31%2018-09-03 16:23:50test_81535991830.0178826{"valid": 0}<#31%2018-09-03 16:23:50test_71535991830.0178826{"valid": 0}<"31%2018-09-03 16:23:50test_61535991830.0178826{"valid": 1}<!31%2018-09-03 16:23:50test_51535991830.0178826{"valid": 1}< 31%2018-09-03 16:23:50test_41535991830.0178826{"valid": 1}<31%2018-09-03 16:23:50test_31535991830.0178826{"valid": 1}