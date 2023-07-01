#!/bin/bash

# This script organizes files in a folder based on their file types

# Function to organize files
organize_files() {
    echo "Enter the directory path:"
    read directory_path

    if [ ! -d "$directory_path" ]; then
        echo "Directory does not exist"
        return
    fi

    # Create directories for each file type
    for file in "$directory_path"/*; do
        if [ -f "$file" ]; then
            file_extension="${file##*.}"
            if [ ! -d "$directory_path/$file_extension" ]; then
                mkdir "$directory_path/$file_extension"
            fi

            mv "$file" "$directory_path/$file_extension"
            echo "Moved file: $file"
        fi
    done

    echo "File organization complete"
}

# Run the function
organize_files
