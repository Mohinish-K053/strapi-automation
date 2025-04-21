#!/bin/bash
apt update -y
apt install docker.io -y
systemctl start docker
docker stop strapi || true
docker rm strapi || true
docker pull mohinish053/strapi-cicd:${DOCKER_TAG}
docker run -d \
    -e APP_KEYS=$(openssl rand -base64 32),$(openssl rand -base64 32),$(openssl rand -base64 32),$(openssl rand -base64 32) \
    -e API_TOKEN_SALT=$(openssl rand -base64 32) \
    -e ADMIN_JWT_SECRET=$(openssl rand -base64 32) \
    -e TRANSFER_TOKEN_SALT=$(openssl rand -base64 32) \
    -e JWT_SECRET=$(openssl rand -base64 32) \
    -p 1337:1337 mohinish053/strapi-cicd:${DOCKER_TAG}
