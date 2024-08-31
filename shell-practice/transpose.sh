#!/bin/bash

# Check if the input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file=$1

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

# Transpose the content of the file
awk '
{
    for (i = 1; i <= NF; i++) {
        # Append the value in the i-th field to the i-th row of the transposed matrix
        if (NR == 1) {
            # For the first row, create the array
            transposed[i] = $i
        } else {
            # For subsequent rows, append values with space
            transposed[i] = transposed[i] " " $i
        }
    }
}
END {
    # Print the transposed matrix row by row
    # for (i = 1; i <= length(transposed); i++) {
    #     print transposed[i]
    # }
    echo "${transposed[@]}"
}' "$file"
