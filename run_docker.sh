#!/usr/bin/env bash

health_check () {
  until $(curl --output /dev/null --silent --head --fail $1); do
    printf '.'
    sleep 1
  done
}

## Complete the following steps to get Docker running locally

# Step 1:
#Tag defined in .env file
docker-compose build

# Step 3:
#Switching steps 2 and 3, because docker-compose images
#only produces output for running stacks
echo "Application starts in background, obtain logs by using docker-compose log"
docker-compose up -d
health_check "http://localhost:8000"
echo "Application running"

# Step 2:
docker-compose images
