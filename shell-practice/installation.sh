#!/bin/bash


USERID=$(id -u)


if [ $USERID -ne 0 ]
then
   echo "please use root access for installation..."
fi