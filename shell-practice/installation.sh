#!/bin/bash

R="\e[31m"

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
   echo -e "$R please use root access for installation...$N"
   exit 1
fi

dnf install mysql -y