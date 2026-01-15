#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Try: sudo $0"
  exit 1
fi

# Load all images
docker load -i redis_8.4.0.tar
docker load -i krosy-backend_image.tar
docker load -i tabpack-controller_image.tar

#docker load -i controller.tar
#docker tag tabpack-controller-packing-table:latest tabpack-controller:latest

# Start compose
docker compose up