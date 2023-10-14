#!/bin/bash

# Remote server details
host="2f05c1f8800b.3be8ebfc.alu-cod.online"
username="2f05c1f8800b"
password="d4a1d225d0abda9549d8"

# Location for backing up your directory on the remote server
remote_directory="/summative/0923-2023S"

# Local directory to backup
local_directory="negpod_8-q1"

# Use rsync to perform the backup
rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" $local_directory $username@$host:$remote_directory

echo "Backup completed to remote server."
