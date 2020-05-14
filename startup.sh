#!/bin/sh

export TZ=Asia/Hong_Kong

git config --global push.default simple

# --------------------
# Jupyter Lab
# --------------------

screen -S jupyter_lab -dm jupyter lab --ip=0.0.0.0 --port=9999 --no-browser --notebook-dir=/app --allow-root --NotebookApp.token='dsteam' ;

printenv >> /etc/environment

bash
