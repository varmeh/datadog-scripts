#!/bin/bash -x

command_exists () {
    type "$1" &> /dev/null ;
}


# Install python3.8+. Required for Agent 7
if ! command_exists python3.8 ; 
then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; 
    then
       apt install python3.8
    elif [[ "$OSTYPE" == "darwin"* ]]; 
    then
        brew install python@3.8
    fi
fi

# Install virtual env
if ! command_exists virtualenv ; then
    python3.8 -m pip install virtualenv
fi

# Create python virtual directory environment
[ -d $HOME/pyenv ] || mkdir $HOME/pyenv
cd $HOME/pyenv

# Create a new environment - dd-integration with python 3.8
[ -d ./dd-integration ] || virtualenv --python=/usr/bin/python3.8 dd-integration

# Activate session
source dd-integration/bin/activate




