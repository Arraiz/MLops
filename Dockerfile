# Base image with Python 3.10 and Jupyter Notebook
FROM python:3.10-slim-buster

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook, NumPy, SciPy, and scikit-learn
RUN pip install --no-cache-dir jupyter numpy scipy scikit-learn pandas seaborn matplotlib

# Set up a working directory
WORKDIR /app

# Create a virtual environment
RUN python -m venv /venv

# Activate the virtual environment
SHELL ["/bin/bash", "-c", "source /venv/bin/activate"]

# Upgrade pip and install dependencies
RUN pip install --no-cache-dir --upgrade pip 

# Create the host directory for notebooks and name the volume as "notebooks_backup"
VOLUME ["/notebooks_backup"]

# Copy the Jupyter Notebook configuration file
COPY jupyter_notebook_config.py /root/.jupyter/

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/notebooks_backup"]