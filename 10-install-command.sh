#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Error:Please Run with root access"
    exit 1
else
    echo "You are running with root usr"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then    
    echo "Mysql is not installed.. going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is SUCCESS"
    else
        echo "Installing MYSQL is FAILURE"
        exit 1
    fi
else
    echo "Mysql is already installed. So skipping"
fi
