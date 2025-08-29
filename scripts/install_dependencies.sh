#!/bin/bash
set -e
set -x

# Make apt non-interactive
export DEBIAN_FRONTEND=noninteractive

# Update system
sudo apt update -y
sudo apt upgrade -y

# Install prerequisites
sudo apt install -y ca-certificates curl gnupg lsb-release lsb-release

# Docker setup
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Node.js and Yarn setup
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt install -y nodejs
sudo npm install -g yarn
