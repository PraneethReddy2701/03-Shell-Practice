#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITIOn=$(echo $line | awk '{print $7F}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk Usage on $PARTITION : $USAGE % <br>"
    fi
done <<< $DISK_USAGE

# echo $MSG

sh mail.sh "DevOps Team" "High Disk Usage" "$IP" "$MSG" "praneeth.kotholla@gmail.com" "ALERT-High Disk Usage"