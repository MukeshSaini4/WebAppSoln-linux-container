#!/bin/bash

echo "===== START DEPLOYMENT ====="

# Go to app directory
cd /home/ubuntu/app

# Fix permissions
chmod +x scripts/*.sh

# Clean old files
echo "Cleaning old files..."
rm -rf /home/ubuntu/app/*

# Copy fresh files from deployment archive
echo "Copying fresh files..."
cp -r /opt/codedeploy-agent/deployment-root/*/*/deployment-archive/* /home/ubuntu/app/

# Move to app folder again
cd /home/ubuntu/app

# Stop old container
echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

# Build Docker image
echo "Building Docker image..."
docker build -t myapp .

# Run container
echo "Running container..."
docker run -d -p 8080:8080 --name myapp myapp

echo "===== DEPLOYMENT COMPLETE ====="
