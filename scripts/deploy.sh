#!/bin/bash
set -e

APP_DIR="/home/ubuntu/docker"

cd $APP_DIR

echo "Stopping old containers..."
docker compose down || true

echo "Starting new containers with docker-compose..."
docker compose up -d --build

echo "Deployment complete!"
