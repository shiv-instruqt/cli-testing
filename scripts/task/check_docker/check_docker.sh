#!/bin/bash

if ! docker info > /dev/null 2>&1; then
  echo "Docker daemon is not running."
  exit 1
fi

if ! docker ps --format '{{.Names}}' | grep -q "flask-app"; then
  echo "flask-app container is not running."
  exit 1
fi

echo "Docker is running and flask-app container is live!"
exit 0
