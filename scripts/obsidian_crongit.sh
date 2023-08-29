#!/bin/sh
echo "****"
echo "Syncing on $(date +"%Y-%m-%d %H:%M:%S")"
echo "----"
if [ -z "$SSH_AUTH_SOCK" ]
then
    export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
fi
sleep 2s

obs_path="/home/liosergent/Documents/obsidian_vault"
cd "$obs_path"

git pull
CHANGES_NUM="$(git status --porcelain | wc -l)"

if [ "$CHANGES_NUM" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "PC cron Sync:  $(date +"%Y-%m-%d %H:%M:%S")"
git push -q
