#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE()
{
    echo "$R USAGE $N sh 18-backup-script.sh <SOURCE_DIR> <DESTINATION_DIR> <DAYS(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source Dir doesnot exist. Please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R Destination Dir doesnot exist. Please check $N"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z "$FILES" ]
then
    echo "Files to zip are : $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"

    if [ -f $ZIP_FILE ]
    then
        echo "Successfully created Zip files"

        while IFS= read -r filepath
        do
            echo "Deleting files: $filepath"
            rm -rf $filepath
        done <<< $FILES

    else
        echo "Failed to create Zip files"
        exit 1
    fi

else
    echo -e "No log files found older than 14 days.. $Y SO SKIPPING $N"
fi