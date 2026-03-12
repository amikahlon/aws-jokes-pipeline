#!/bin/bash
set -e

dnf install docker -y
systemctl start docker
systemctl enable docker

aws ecr get-login-password --region ${AWS_REGION} \
  | docker login --username AWS --password-stdin ${REGISTRY}

docker pull ${IMAGE}

docker stop client 2>/dev/null || true
docker rm   client 2>/dev/null || true

docker run -d \
  --restart unless-stopped \
  --name client \
  -p 3000:3000 \
  ${IMAGE}
