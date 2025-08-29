#!/bin/bash
# ===============================================
# Script: install_codedeploy_agent.sh
# Purpose: Install and start AWS CodeDeploy agent
# Author: Hardik Rangucha
# ===============================================

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
REGION="eu-north-1" # Replace with your AWS region, e.g., us-east-1
CODEDEPLOY_INSTALLER_URL="https://aws-codedeploy-${REGION}.s3.${REGION}.amazonaws.com/latest/install"
INSTALL_DIR="/home/ubuntu"

echo "Updating system packages..."
sudo apt update -y
sudo apt install ruby-full wget unzip -y

echo "Downloading CodeDeploy agent installer..."
cd $INSTALL_DIR
wget $CODEDEPLOY_INSTALLER_URL -O install
chmod +x install

echo "Installing CodeDeploy agent..."
sudo ./install auto

echo "Starting CodeDeploy agent..."
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent

echo "Checking CodeDeploy agent status..."
sudo systemctl status codedeploy-agent

echo "CodeDeploy agent installation and startup complete!"
