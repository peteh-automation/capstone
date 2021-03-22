#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
version="v2"
dockerpath="peterheybrock/capstone:$version"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username=peterheybrock
docker tag capstone "$dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
