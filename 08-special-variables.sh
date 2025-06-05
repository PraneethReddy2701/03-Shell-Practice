#!/bin/bash

echo "To pass all variables to the script : $@"
echo "Number of variables passed : $#"
echo "Script name is : $0"
echo "Current directory is : $PWD"
echo "User running this script is : $USER"
echo "Home directory of user is : $HOME"
echo "PID of current script is : $$"
sleep 10 &
echo "PID of last command executed : $!"
echo "exit status of last command executed : $?"
