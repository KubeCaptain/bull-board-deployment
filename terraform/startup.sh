#!/bin/bash

# Update packages and install Docker and Docker Compose
apt-get update
apt-get install -y docker.io docker-compose

# Enable and start Docker service
systemctl enable docker
systemctl start docker

# Create directory for the app
mkdir -p /opt/bull-board

# Copy docker-compose.yml from /tmp (uploaded by Terraform) to the app directory
cp /tmp/docker-compose.yml /opt/bull-board/docker-compose.yml

# Change directory to the app folder
cd /opt/bull-board

# Run docker-compose to start containers in detached mode
docker-compose up -d
