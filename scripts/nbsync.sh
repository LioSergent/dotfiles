#!/bin/bash
nb="$(basename "$1" .py).ipynb"
echo "Syncing $1 with ipynb counterpart, running jupyter in background
and selenium servers in background, to be run in folder where $1 is"
jupyter notebook stop 8888
tmux split-window "jupyter notebook --autoreload --NotebookApp.token=aaa"
# Kernel might have to be changed, kind of weird how it behaves right now
jupytext --set-kernel python3 --set-formats ipynb,py:percent --sync $1
tmux split-window "jure --token=aaa --jupyter_root_dir=. --notebook_path=$nb"
