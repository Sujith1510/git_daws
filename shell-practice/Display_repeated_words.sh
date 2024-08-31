#!/bin/bash

filename=$1

while read line
do
    echo "$line" | wc -w
done < $filename