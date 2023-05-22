#!/bin/bash

# Set the new container name
NEW_CONTAINER_NAME="new-jupyter-container"

# Set the new password
NEW_PASSWORD="new-password"

# Modify the container name in the Docker Compose file
sed -i ''  "s/container_name: default/container_name: ${NEW_CONTAINER_NAME}/g" docker-compose.yml
sed -i ''  "s|c.NotebookApp.password.*|c.NotebookApp.password = passwd('${NEW_PASSWORD}')|" jupyter_notebook_config.py

# Build and launch the container using Docker Compose
#docker-compose up --build

# Restore the original Docker Compose file and Jupyter Notebook config
#git checkout docker-compose.yml
#git checkout jupyter_notebook_config.py