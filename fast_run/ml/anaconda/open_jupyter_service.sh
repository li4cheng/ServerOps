#/bin/bash
jupyter notebook --generate-config --allow-root #生成并激活配置文件
#消除配置文件的注释
sed -i 's/^#\([ ]*c.NotebookApp.ip\)/\1/' ~/.jupyter/jupyter_notebook_config.py
sed -i 's/^#\([ ]*c.NotebookApp.port\)/\1/' ~/.jupyter/jupyter_notebook_config.py
sed -i 's/^#\([ ]*c.NotebookApp.open_browser\)/\1/' ~/.jupyter/jupyter_notebook_config.py
sed -i 's/^#\([ ]*c.NotebookApp.password\)/\1/' ~/.jupyter/jupyter_notebook_config.py

#修改启动参数配置
sudo sed -i 's/^[ ]*c.NotebookApp.ip.*/c.NotebookApp.ip = "0.0.0.0"/g' ~/.jupyter/jupyter_notebook_config.py
sudo sed -i 's/^[ ]*c.NotebookApp.port.*/c.NotebookApp.port = 8888/g' ~/.jupyter/jupyter_notebook_config.py
sudo sed -i 's/^[ ]*c.NotebookApp.open_browser.*/c.NotebookApp.open_browser = False/g' ~/.jupyter/jupyter_notebook_config.py
sudo sed -i 's/^[ ]*c.NotebookApp.password.*/c.NotebookApp.password = "sha1:2f319121e25b:f20f8fe27e89d0afcc70b7cf3d6e997268abd2f5"/g' ~/.jupyter/jupyter_notebook_config.py

jupyter-notebook
chmod a+r -R /run/user/0
chown a+rwx -R /run/user/0/jupyter
chmod a+x /run/user
