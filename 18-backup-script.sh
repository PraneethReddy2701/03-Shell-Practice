#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

if [ $# -lt 2 ]
then
    USAGE
fi

USAGE()
{
    echo -e "$R USAGE: $N sh 18-backup-script.sh <SOURCE_DIR> <DESTINATION_DIR> <DAYS(optional)>"
    exit 1
}

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source Directory does not exist. Please check $N"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]
then
    echo -e "$R Destination Directory does not exist. Please check $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z "$FILES" ]
then
    echo "Files to zip are : $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DESTINATION_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully created zip file"
        while IFS= read -r filepath
        do
            echo "Deleting file: $filepath" 
            rm -rf $filepath
        done <<< $FILES
        echo -e "Log files older than $DAYS from $SOURCE_DIR directory removed.. $G SUCCESS $N"
     else
        echo -e "Zip file creation...$R FAILURE $N"
        exit 1
    fi
else
    echo -e "No logs files older than 14 days... $Y SO SKIPPING $N"
fi

