#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "ERROR: Please run the script with root access"
    exit 1
else
    echo "You are running with root access"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo "Installig $2 is SUCCESS"
    else
        echo "Installing $2 is FAILURE"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed.. going to install"
    dnf install msql -y
    VALIDATE()
else
    echo "Mysql is installed.. So SKIPPING"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "Python is not installed.. going to install"
    dnf install python3 -y
    VALIDATE()
else
    echo "Python3 is installed.. So SKIPPING"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not installed..Going to install"
    dnf install nginx -y
    VALIDATE()
else
echo "Nginx is already installed.. SO SKIPPING"
    