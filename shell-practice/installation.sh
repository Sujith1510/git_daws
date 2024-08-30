#!/bin/bash

LOGFOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d . -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGFOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGFOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please use root access for installation...$N " | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
  if [ $1 -ne 0 ]
  then 
     echo -e "$2 installation is $R FAILED..$N" | tee -a $LOG_FILE
  else
     echo -e "$2 installation is $G SUCCESSFULL..$N" | tee -a $LOG_FILE
  fi
}

CHECK_ROOT 

for package in $@
do 
  dnf list installed $package &>> $LOG_FILE
  if [ $? -ne 0 ]
  then 
     echo -e "$Y $package is not installed going to install $N" | tee -a $LOG_FILE
     dnf install $package -y &>> $LOG_FILE
     VALIDATE $? $package 
  else
     echo -e "$G $package is installed already...$N" | tee -a $LOG_FILE
  fi
done
