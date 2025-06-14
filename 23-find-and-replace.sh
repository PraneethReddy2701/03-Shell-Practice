#!/bin/bash

FIND=$1
REPLACE=$2 
DIRECTORY=$3

if [ $# -ne 3 ]
then 
    echo "USAGE: $0 <FIND> <REPLACE> <FILE_NAME>"
    exit 1
fi

for file in "$DIRECTORY"/*.txt
do
    if [ -f "$file" ]
    then
        sed -i "s/$FIND/$REPLACE/g" "$file"
        echo "Replaced in : $file"
    fi
done