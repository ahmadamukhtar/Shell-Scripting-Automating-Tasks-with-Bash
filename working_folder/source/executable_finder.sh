#!/bin/bash

# Define the base directory
base_dir="source"

# Define the log file
log_file="$base_dir/executables.log"

# Check if the base directory exists
if [ ! -d "$base_dir" ]; then
    echo "Directory 'source/' does not exist."
    exit 1
fi

# Create or clear the log file
> "$log_file"

# Find and log executable files in each subdirectory
find "$base_dir" -type d | while read -r dir; do
    # Find executable files in the current directory
    executables=$(find "$dir" -maxdepth 1 -type f -executable)

    # If there are executables, print and log them
    if [ -n "$executables" ]; then
        echo "Directory: $dir"
        echo "Directory: $dir" >> "$log_file"
        
        for exe in $executables; do
            echo "  $exe"
            echo "  $exe" >> "$log_file"
        done
    fi
done

echo "Executable files have been listed and logged in $log_file."

