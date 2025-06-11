#!/bin/bash

SOURCE_DIR=/home/ec2-user/app-logs

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS=read -r FILEPATH
do
    echo $FILEPATH
done