#!/bin/bash
nb="$(basename "$1" .py).ipynb"
echo "Syncing $1 with ipynb counterpart, running jupyter in background
and selenium servers in background, to be run in folder where $1 is"
jupyter notebook stop 8888
gnome-terminal --working-directory=`pwd` -e "jupyter notebook --autoreload --NotebookApp.token=aaa"
# Kernel might have to be changed, kind of weird how it behaves right now
jupytext --set-kernel python3 --set-formats ipynb,py:percent --sync --execute $1
jure --token=aaa --jupyter_root_dir=. --notebook_path=$nb
