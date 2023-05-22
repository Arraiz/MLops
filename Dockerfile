# Base image with Python 3.10 and Jupyter Notebook
FROM python:3.10-slim-buster

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook
RUN pip install jupyter

# Set up a working directory
WORKDIR /app

# Copy the Jupyter Notebook configuration file
COPY jupyter_notebook_config.py /root/.jupyter/

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888"]