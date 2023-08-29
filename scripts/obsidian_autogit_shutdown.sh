#!/bin/sh

obs_path="/home/liosergent/Documents/obsidian_vault"
cd "$obs_path"

git pull
CHANGES_NUM="$(git status --porcelain | wc -l)"

if [ "$CHANGES_NUM" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "PC shutdown service Sync:  $(date +"%Y-%m-%d %H:%M:%S")"
git push -q
