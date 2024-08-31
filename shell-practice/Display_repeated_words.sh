#!/bin/bash

# Check if the input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Read the file and store it in a variable
file=$1

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

tr '[:upper:]' '[:lower:]' < "$file" |      # Convert to lowercase
tr -d '[:punct:]' |                         # Remove punctuation
tr ' ' '\n' |                               # Split words into new lines
grep -v '^$' |                              # Remove empty lines
# sort |                                      # Sort words
# uniq -c |                                   # Count occurrences
# sort -nr |                                  # Sort by count (numerically, in reverse order)
# head -n 5                                   # Display the top 5

