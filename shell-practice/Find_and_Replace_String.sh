#!/bin/bash

# Colour code
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Define the directory, search string, and replacement string

DIRECTORY="$1"
FIND_STRING="$2"
REPLACE_STRING="$3"

USAGE(){
  echo -e "$Y USAGE: sudo sh shellscript_filename.sh directory find_string replace_string $N"
  exit 1
}

if [ $# -eq 0 ]
then
  USAGE
fi

# Find all .txt files in the specified directory and its subdirectories
find "$DIRECTORY" -type f -name "*.txt" | while read -r F; do
  # Use sed to replace the search string with the replacement string in each file
  if [ $FIND_STRING == $REPLACE_STRING ]
  then     
    echo -e "Replaced the string in the files $R FAILED $N $Y Please enter the existing string $N"
  else
    sed -i "s/$FIND_STRING/$REPLACE_STRING/g" "$F"
    echo -e "Replaced the string in the files $R FAILED $N $Y Please enter the existing string $N"
  fi
done

# if [ $? -eq 0 ]
# then
#    echo -e "Replaced the string in the files $G SUCCESS $N"
# else
#    echo -e "Replaced the string in the files $R FAILED $N $Y Please enter the existing string $N"
# fi