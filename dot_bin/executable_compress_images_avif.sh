#!/usr/bin/env dash

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

# Find image files and process them
fd -e 'jpg' -e 'png' -e 'jpeg' --search-path "$1" -x sh -c '
    if ! file -b --mime-type "{}" | grep -q "^image/avif"; then
        avifenc --jobs all "{}" "{}" && echo "Processed: {}" || echo "Failed: {}"
    # else
    #     echo "Skipped: {}"
    fi
' \;
