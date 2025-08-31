#!/usr/bin/env bash

# Check if directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory '$1' does not exist"
  exit 1
fi

# Count sync-conflict files first
conflict_count=$(fd -H -a -t f --glob "*.sync-conflict*" --search-path "$1" | wc -l)

if [ "$conflict_count" -eq 0 ]; then
  echo "No sync-conflict files found in: $1"
  exit 0
fi

echo "Found $conflict_count sync-conflict files in: $1"
echo "Files to be removed:"
fd -H -a -t f --glob "*.sync-conflict*" --search-path "$1"

read -p "Do you want to remove all these files? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  fd -H -a -t f --glob "*.sync-conflict*" --search-path "$1" -x sh -c '
        rm "{}" && echo "Removed: {}" || echo "Failed to remove: {}"
    ' \;
  echo "Sync-conflict cleanup completed!"
else
  echo "Operation cancelled."
fi
