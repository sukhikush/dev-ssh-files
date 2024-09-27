#!/bin/bash

# Delete all node_module and package_lock.json file from development sub directories

# find . -name "node_modules" -type d
# find . -name "node_modules" -type d -exec rm -rf {} \;
current_path=$(pwd)

# Check if "/home/sukhi/MyFiles/1_Development/" is part of the current path
if [[ ! "$current_path" =~ "/home/sukhi/MyFiles/1_Development" ]]; then
# Not found, change to "/home/sukhi/MyFiles/1_Development/"
    echo "Script deletes node_modules folders and package-lock.json file only from /home/sukhi/MyFiles/1_Development/, which is not the current directory, EXITING CODE..."
    exit 1
fi


# Prompt user for confirmation (optional)
read -p "Deleteing  node_modules folders and package-lock.json file in all subdirectories of '$current_path'. Are you sure? (Y/y | N/n) " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  # Find node_modules folders recursively and delete them
    find "$current_path" -type d -name "node_modules" -exec rm -rf {} \; -prune
    find "$current_path" -name "package-lock.json" -delete
    echo "node_modules and package-lock.json deleted!"
else
  echo "Operation cancelled."
fi