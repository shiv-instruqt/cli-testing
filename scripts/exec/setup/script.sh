#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker || true
systemctl start docker || true

until docker info > /dev/null 2>&1; do
    echo "Waiting for Docker daemon..."
    sleep 2
done

docker pull shivtushal/git-lab:python-app-1.0

docker stop flask-app 2>/dev/null || true
docker rm flask-app 2>/dev/null || true

docker run -d \
  --name flask-app \
  --restart unless-stopped \
  -p 5000:5000 \
  shivtushal/git-lab:python-app-1.0

echo "Setup complete. Flask app running on port 5000."
