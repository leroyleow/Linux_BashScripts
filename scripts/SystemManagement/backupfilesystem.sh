#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will create backup of /etc and /var directories using tar command. Compress the backup .tar file using gzip command.
# Usage: backupfilesystem <backup_tar_file>

if [ "$#" -ne 1 ] 
then 
 echo "Usage backupfilesystem <backup_tar_file>"; exit 1;
fi

echo "Backup /etc /var to /tmp/$1"
tar cvf /tmp/$1 /etc /var
echo "Gzipping $1 in tmp folder"
gzip /tmp/$1

find /tmp/$1.gz -mtime -1 -type f -print &> /dev/null
if [ $? -eq 0 ]
then 
    echo "Backup was created" 
    echo
    echo "Archiving Backup"
    scp /tmp/$1.gz roo@[ip address]
else
    echo "Backup failed"
fi
