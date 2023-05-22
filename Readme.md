## build it

```docker build -t jupyter-env:latest .````

## deploy it (make sure you have the mounting host point at the correct place) ej: /home/project/data

docker run -p 8888:8888 -v /Users/mikeldiez/docker-things/jupyterenv/data:/notebooks_backup --name jupyter-container jupyter-env:latest
