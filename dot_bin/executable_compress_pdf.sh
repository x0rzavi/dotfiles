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

# Find pdf files and process them
fd -e 'pdf' --search-path "$1" -x sh -c "
# Check if file was already processed by looking for our marker in metadata
if pdfinfo '{}' 2>/dev/null | grep -q 'Producer.*Ghostscript'; then
    echo 'Skipped: {} (already optimized)'
else
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile='/tmp/temp_{/}' '{}' && \
    mv '/tmp/temp_{/}' '{}' && \
    echo 'Processed: {}'
fi
" \;
