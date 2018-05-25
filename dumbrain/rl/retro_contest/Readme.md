# Retro Contest

All of my submission stuff from the April-June 2018 OpenAI Retro Contest

I wrote a few blog posts during the contest about my experience:

 - [Collision Maps](https://mikelyons.org/2018/05/20/Retro-OpenAI-Collision-Map.html)
 - [Running Multiple Retro Environments](https://mikelyons.org/2018/05/22/Multiple-Retro-Environments.html)


## About the contest

In June 2018 OpenAI held their first Retro contest, where competitors compete to build
agent that plays the genesis sonic games. The catch is that you have to play on hidden
custom build sonic levels, and you only have 1,000,000 steps to do so.

From the contest site:

[Link to site (May eventually die)](https://contest.openai.com/)

> We're holding a transfer-learning contest using the Sonic The Hedgehog™ series of games for SEGA Genesis. In this contest, participants try to create the best agent for playing custom levels of the Sonic games — without having access to those levels during development. See our blog post for more details.
> Here's how the contest works:
> 1. Train or script your agent to play Sonic The Hedgehog™
> 1. Submit your agent to us as a Docker container
> 1. We evaluate your agent on a set of secret test levels
> 1. Your agent's score appears on the leaderboard
> 
> We believe that the next step for reinforcement learning is to leverage past experience to quickly learn new environments. Current algorithms are very prone to memorization and can't adapt well to new situations. While this contest focuses on video game levels, we hope the winning techniques will be applicable to a wide variety of domains.
>
> The contest will run from April 5 to June 5 (2 months) and winners will receive some pretty cool trophies.
>
> To see rules for the contest or to get started with it, look at the details page. To see the current best submissions check out the leaderboard. The blog post has an overview of the motivations for the contest and the tech report describes the benchmark used by the contest in detail.


## My approach to the contest

During the contest I worked on a few different projects:

### [Template Matching](template-matching/): 

The goal was to quickly identify where sonic is on screen, and feed that into the agent. It
ended up being too slow to do CPU template matching, so I did not end up using the results
in my submission.

### [Sonic Collision Map U-Net](collision-map/):

![Collision Map Gif](images/collision-map.gif)

By using the sonic level chunks exported via SonLVL I was able to build a fast collision map
detector based on the pix2pix u-net structure. More information about the network structure
and results are available here: [Blog Post: Running Multiple Retro Environments](https://mikelyons.org/2018/05/22/Multiple-Retro-Environments.html)

### [Pre-trained Rainbow DQN](retro-entry/):

My final submission was a pre-trained rainbow DQN Agent. Joint trained on 10s of millions of Sonic steps 
accross all 54 available training levels. I leveraged the [anyrl-py](https://github.com/unixpickle/anyrl-py)
python framework for the network structure and training loop, and ran my joint training on the
[PaperSpace Gradient ML Job Cloud](https://www.paperspace.com/)

The Agent takes the current game state as an `(84, 84, 2)` frame, where one channel is the grayscale
sonic frame, and the other is the collision map generated by my sonic collision map model.