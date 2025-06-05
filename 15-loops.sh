#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

if [ $USERID -ne 0 ]
then
    echo -e "$R Error : Please run this script with root access $N"
    exit 1
else    
    echo " You are running the script with root access "
fi

echo "Script started running at : $(date)"

mkdir -p $LOGS_FOLDER

VALIDATE ()
{
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is $G SUCCESS $N"
    else
        echo -e "Installing $2 is $R FAILURE $N"
        exit 1
    fi
}

for package in ${PACKAGES(@)}
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed.. going to install"
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo -e "$Y $package is already installed.. Nothing to do $N"
    fi
done