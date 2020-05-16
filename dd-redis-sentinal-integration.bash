#!/bin/bash

# Move to folder. Default folder for integration-extras
mkdir $HOME/dd && cd $HOME/dd

git clone https://github.com/DataDog/integrations-extras.git

# Install ddev cli
python -m pip install datadog-checks-dev

# Install dependencies of ddev
python -m pip install click semver toml appdirs atomicwrites pyperclip

# Configure Extras folder
ddev config set extras ./integrations-extras

# Build Redis Sentinel
ddev -e release build redis_sentinel

# Install it to your host datadog-agent
datadog-agent integration install -w -r $HOME/dd/integrations-extras/redis_sentinel/dist/datadog_redis_sentinel-0.0.1-py2.py3-none-any.whl
