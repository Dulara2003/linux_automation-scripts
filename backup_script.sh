#!/bin/bash

source_dir="/home/dulara"
backup_dir="/home/dulara/backup"

mkdir -p $backup_dir

echo "Starting backup..."

cp -r $source_dir/* $backup_dir/

echo "Backup completed at $(date)" >> backup_log.txt

echo "Backup finished successfully"
