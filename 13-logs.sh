#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: Please runn the script with root access $N" | tee -a $LOG_FILE
    exit 1
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi

mkdir -p LOGS_FOLDER  # -p (if folder is already present it skips or else it will create the folder)
echo "Script started executing at : $(date)" | tee -a $LOG_FILE

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo -e " Installing $2 is $G SUCCESS $N " | tee -a $LOG_FILE
    else
        echo -e " Installing $2 is $R FAILURE $N " | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql | &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "Mysql is not installed.. going to install it" | tee -a $LOG_FILE
    dnf install mysql -y | &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "Mysql is already installed.. $Y So SKIPPING $N " | tee -a $LOG_FILE
fi

dnf list installed python3 | &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "Python3 is not installed.. going to install" | tee -a $LOG_FILE
    dnf install python3 -y | &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo "Python3 is already installed.. $Y So SKIPPING $N " | tee -a $LOG_FILE
fi

dnf list installed nginx | &>>LOG_FILE
if [ $? -ne 0 ]
then 
    echo "Nginx is not installed .. going to install it" | tee -a $LOG_FILE
    dnf install nginx -y | &>>LOG_FILE
    VALIDATE $? "nginx"
else
    echo "Nginx is already installed.. $Y So SKIPPING $N " | tee -a $LOG_FILE
fi