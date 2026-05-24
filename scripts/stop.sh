#!/bin/bash

echo "Stopping existing container (if any)..."

docker stop myapp || true
docker rm myapp || true
