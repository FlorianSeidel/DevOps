#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# Defined in docker-compose and .env file

# Step 2:  
# Authenticate & tag
docker login $1

# Step 3:
# Push image to a docker repository
docker-compose push
