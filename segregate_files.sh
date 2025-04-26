#!/bin/bash

# Directory to organize
base_dir="files"

# Ensure the base directory exists
if [ ! -d "$base_dir" ]; then
    echo "Directory 'files/' does not exist. Please create it and add your files."
    exit 1
fi

# Subdirectories for different file types
pdf_dir="$base_dir/pdf_files"
c_dir="$base_dir/c_files"
h_dir="$base_dir/h_files"

# Create subdirectories if they don't already exist
mkdir -p "$pdf_dir"
mkdir -p "$c_dir"
mkdir -p "$h_dir"

# Move files into their respective directories
for file in "$base_dir"/*; do
    if [[ -f "$file" ]]; then
        case "$file" in
            *.pdf)
                mv "$file" "$pdf_dir/"
                ;;
            *.c)
                mv "$file" "$c_dir/"
                ;;
            *.h)
                mv "$file" "$h_dir/"
                ;;
        esac
    fi
done

# Zip each subdirectory and place the zip archives in the "files/" directory
zip -r "$base_dir/pdf_files.zip" "$pdf_dir" > /dev/null 2>&1
zip -r "$base_dir/c_files.zip" "$c_dir" > /dev/null 2>&1
zip -r "$base_dir/h_files.zip" "$h_dir" > /dev/null 2>&1

echo "Files segregated and zipped successfully."

