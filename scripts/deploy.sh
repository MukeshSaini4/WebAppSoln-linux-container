#!/bin/bash
chmod +x /home/ubuntu/app/scripts/deploy.sh

cd /home/ubuntu/app

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "Building new image..."
docker build -t myapp .

echo "Running new container..."
docker run -d -p 8080:8080 --name myapp myapp