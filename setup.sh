#!/bin/bash


DOCKER_COMPOSE_FILE="docker-compose.yml"
# Set the new container name
NEW_CONTAINER_NAME="test"
mkdir ${NEW_CONTAINER_NAME}
# Set the new password
NEW_PASSWORD="test"

custom_volume="./${NEW_CONTAINER_NAME}/data:/notebook_backup"



# Modify the container name in the Docker Compose file
sed -i ''  "s/container_name:.*/container_name: ${NEW_CONTAINER_NAME}/g" ${DOCKER_COMPOSE_FILE}
# Search for the "volumes" line and replace it with the custom volume string
sed -i ''  "s|volumes:.*|volumes:\n      - $custom_volume|" "$DOCKER_COMPOSE_FILE"
sed -i ''  "s|c.NotebookApp.password.*|c.NotebookApp.password = passwd('${NEW_PASSWORD}')|" jupyter_notebook_config.py

# Build and launch the container using Docker Compose
##docker-compose up --build 

# Restore the original Docker Compose file and Jupyter Notebook config
#git checkout docker-compose.yml
#git checkout jupyter_notebook_config.py