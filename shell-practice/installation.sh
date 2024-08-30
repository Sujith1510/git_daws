#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please use root access for installation...$N"
        exit 1
    fi
}

VALIDATE(){
  echo  "exit status: $1"
}

CHECK_ROOT 

for package in $@
do 
  dnf list installed $package
  VALIDATE $?
  if [ $? -ne 0 ]
  then 
     echo -e "$Y $package is not installed going to install $N"
    #  dnf install $package -y
    #  VALIDATE $?
  else
     echo -e "$G $package is installed already...$N"
  fi
done
