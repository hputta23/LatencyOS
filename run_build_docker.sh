#!/bin/bash
set -e

# Build the builder image
echo "Building the Docker image..."
docker build -t latencyos-builder -f Dockerfile.builder .

# Run the build container
# --privileged is required for loop mounting filesystems (archiso requirement)
echo "Running the build container..."
echo "Output will be in $(pwd)/out"

docker run --rm -it \
    --privileged \
    -v "$(pwd):/build" \
    latencyos-builder

echo "Done. Check the 'out/' directory."
