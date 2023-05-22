#!/bin/bash


DOCKER_COMPOSE_FILE="docker-compose.yml"
# Set the new container name
NEW_CONTAINER_NAME="test2"
NEW_DOCKER_COMPOSE_FILE="${NEW_CONTAINER_NAME}.yml"
mkdir ${NEW_CONTAINER_NAME}
# Set the new password
NEW_PASSWORD="test2"

custom_volume="./${NEW_CONTAINER_NAME}/data:/notebooks_backup"



# Modify the container name in the Docker Compose file
sed -i   "s/container_name:.*/container_name: ${NEW_CONTAINER_NAME}/g" ${DOCKER_COMPOSE_FILE}
# Search for the "volumes" line and replace it with the custom volume string
sed -i '$d' "$DOCKER_COMPOSE_FILE"
sed -i   "s|volumes:.*|volumes:\n      - $custom_volume|" "$DOCKER_COMPOSE_FILE"
sed -i   "s|c.NotebookApp.password.*|c.NotebookApp.password = passwd('${NEW_PASSWORD}')|" jupyter_notebook_config.py

