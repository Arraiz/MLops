from notebook.auth import passwd

c.NotebookApp.password = passwd('test')
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
