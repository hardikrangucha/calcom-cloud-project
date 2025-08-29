#!/bin/bash
cd /home/ubuntu/docker

# Enable extended pattern matching
shopt -s extglob

# Delete everything except .env and calcom folder
rm -rf !(.env|calcom)
