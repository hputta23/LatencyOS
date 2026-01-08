#!/bin/bash
set -e

# Build the builder image
echo "Building the Docker image..."
docker build -t latencyos-builder -f Dockerfile.builder .

# Run the build container
# --privileged is required for loop mounting filesystems (archiso requirement)
echo "Running the build container..."
echo "Output will be in $(pwd)/out"

# We use 'script' to capture output preserving colors, or just redirection
docker run --rm \
    --privileged \
    -v "$(pwd):/build" \
    latencyos-builder \
    bash -c "./build_iso.sh > build.log 2>&1"

echo "Build container finished. Check build.log."
