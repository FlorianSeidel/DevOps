#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
# Defined in .env file, ml-predict.yml file is generated using "make konvert"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f ml-predict.yml

# Step 3:
# List kubernetes pods
echo "Waiting for pods to be ready..."
kubectl wait --for condition=ready pod -l io.kompose.service=predictor --timeout=15s
kubectl get pods -o wide
kubectl get services -o wide

# Step 4:
# Forward the container port to a host
# Done in Step 2
