#!/bin/bash

R="\e[31m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e "$R please use root access for installation...$N"
   exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
   echo -e "$Y msql is not installed $N"
   exit 1
fi
