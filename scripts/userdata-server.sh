#!/bin/bash
set -e

yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

aws ecr get-login-password --region ${AWS_REGION} \
  | docker login --username AWS --password-stdin ${REGISTRY}

docker pull ${IMAGE}

docker stop server 2>/dev/null || true
docker rm   server 2>/dev/null || true

docker run -d \
  --restart unless-stopped \
  --name server \
  -p 3001:3001 \
  ${IMAGE}
