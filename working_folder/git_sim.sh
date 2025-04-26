#!/bin/bash

# Directory to store backups (simulating .git directory)
backup_dir=".backup"

# Function to simulate 'git init'
init() {
    # Check if backup already exists
    if [ -d "$backup_dir" ]; then
        echo "The directory has already been initialized. Updating the backup..."
        # Update the backup folder with the latest files
        rsync -a --delete --exclude="$backup_dir" ./ "$backup_dir/"
        echo "Backup updated."
    else
        # Create a backup of the current directory
        mkdir "$backup_dir"
        rsync -a --exclude="$backup_dir" ./ "$backup_dir/"
        echo "Initialized the directory and created a backup."
    fi
}

status() {
    # Check if backup exists
    if [ ! -d "$backup_dir" ]; then
        echo "The directory is not initialized. Please run 'init' first."
        return
    fi

    echo "Checking the status of files..."

    # Compare current directory files with the backup
    # Show changes between the current directory and the backup
    diff -rq . "$backup_dir" --exclude="$backup_dir" | while read -r line; do
        if [[ $line == *"Only in"* ]]; then
            file=$(echo "$line" | sed 's/Only in //' | sed 's/: /\//')
            # Ignore untracked files inside the .backup directory
            if [[ $file != "$backup_dir"* ]]; then
                echo "Untracked or removed file: $file"
            fi
        elif [[ $line == *"differ"* ]]; then
            file=$(echo "$line" | sed 's/Files //' | sed 's/ and.* differ//')
            echo "Modified file: $file"
            # Show the actual differences for modified files
            echo "Differences for $file:"
            diff "$file" "$backup_dir/$file"
        fi
    done
}


# Main program logic
# Check what function the user wants to run
if [ "$1" == "init" ]; then
    init
elif [ "$1" == "status" ]; then
    status
else
    echo "Usage: $0 {init|status}"
fi

