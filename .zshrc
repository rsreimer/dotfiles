# Path to your oh-my-zsh installation.
export ZSH=/home/rsreimer/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
export TERM="xterm-256color"

plugins=(git)

# User configuration

export PATH="/home/rsreimer/ros-workspace/devel/bin:/opt/ros/jade/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

source .oh-my-zsh/lib/alias.zsh
