#!/bin/bash

f=$1

i=1
while read line
do
    echo "$line"
done < $f