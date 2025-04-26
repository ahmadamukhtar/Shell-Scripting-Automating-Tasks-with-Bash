#!/bin/bash

# Define the log file to be created in the current directory
log_file="executables.log"

# Create or clear the log file at the start
> "$log_file"

# Find all subdirectories in the current directory
find . -mindepth 2 -type d | while read -r dir; do
    # Find executable files in the current subdirectory
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
