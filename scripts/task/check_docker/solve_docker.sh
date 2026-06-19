#!/bin/bash

systemctl start docker || true

until docker info > /dev/null 2>&1; do
    sleep 2
done

docker stop flask-app 2>/dev/null || true
docker rm flask-app 2>/dev/null || true

docker run -d \
  --name flask-app \
  --restart unless-stopped \
  -p 5000:5000 \
  shivtushal/git-lab:python-app-1.0

echo "Solved."
exit 0
