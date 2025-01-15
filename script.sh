#!/bin/bash

# Get new files (added in the last commit)
git log -1 --name-status --pretty=format: | grep "^A" | cut -f2 > new_files.txt

# Get updated files (modified in the last commit)
git log -1 --name-status --pretty=format: | grep "^M" | cut -f2 > updated_files.txt

# Get deleted files (removed in the last commit)
git log -1 --name-status --pretty=format: | grep "^D" | cut -f2 > deleted_files.txt

echo "Files categorized into new_files.txt, updated_files.txt, and deleted_files.txt"

