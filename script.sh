#!/bin/bash

# Get added files (newly added in the last commit)
git log -1 --name-status --pretty=format: | grep "^A" | cut -f2 > new_files.txt

# Get modified files (modified in the last commit)
git log -1 --name-status --pretty=format: | grep "^M" | cut -f2 > updated_files.txt

# Get renamed files (files that were renamed in the last commit)
git log -1 --name-status --pretty=format: | grep "^R" | while read status file1 file2; do
  # Treat the renamed file as a deleted file (file1) and a new file (file2)
  echo $file1 >> deleted_files.txt
  echo $file2 >> new_files.txt
done

# Get deleted files (files removed in the last commit)
git log -1 --name-status --pretty=format: | grep "^D" | cut -f2 >> deleted_files.txt

echo "Files categorized into new_files.txt, updated_files.txt, and deleted_files.txt"

