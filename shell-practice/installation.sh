#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo -e "$R please use root access for installation...$N"
   exit 1
fi

for package in $@
do 
  dnf list installed $package
  if [ $? -ne 0 ]
  then 
     echo -e "$Y $package is not installed on the server...$N"
  else
     echo -e "$G $package is installed already...$N"
  fi
done
