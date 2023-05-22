from notebook.auth import passwd

c.NotebookApp.password = passwd('teleco') # change this for your desired passwd h4ck3rm4n
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False