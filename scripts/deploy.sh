#!/bin/bash

echo "===== START DEPLOYMENT ====="

cd /home/ubuntu/app

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "Building image..."
docker build -t myapp -f WebApp/Dockerfile .

echo "Running container..."
docker run -d -p 8080:8080 --name myapp myapp

echo "===== DONE ====="
