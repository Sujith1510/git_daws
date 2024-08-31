#!/bin/bash

f=textfile.txt


i=1

while read line
do
 echo "$line"
 i=$((i+1))
done < $f