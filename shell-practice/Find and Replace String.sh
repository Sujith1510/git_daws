#!/bin/bash

# Define the directory, search string, and replacement string
DIRECTORY="/home/ec2-user/dir"
FIND_STRING="hi"
REPLACE_STRING="Hi"

# Find all .txt files in the specified directory and its subdirectories
find "$DIRECTORY" -type f -name "*.txt" | while read -r F; do
  # Use sed to replace the search string with the replacement string in each file
  sed -i "s/$FIND_STRING/$REPLACE_STRING/g" "$F"
done

