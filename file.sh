#!/bin/bash

 to watch
WATCH_DIR="/d/demo03-dev"

# Backup directory
BACKUP_DIR="/d"

# Check if the backup directory exists, if not, create it
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Find the most recently modified file
MOST_RECENT_FILE=$(find "$WATCH_DIR" -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)

if [ -z "$MOST_RECENT_FILE" ]; then
  echo "No files found in the directory."
  exit 1
fi

# Display the most recently modified file
echo "Most recently modified file: $MOST_RECENT_FILE"

# Create the necessary directory structure in the backup directory
REL_PATH=$(realpath --relative-to="$WATCH_DIR" "$MOST_RECENT_FILE")
mkdir -p "$BACKUP_DIR/$(dirname "$REL_PATH")"

# Copy the file to the backup directory
cp "$MOST_RECENT_FILE" "$BACKUP_DIR/$REL_PATH"

echo "Backed up: $MOST_RECENT_FILE to $BACKUP_DIR/$REL_PATH"

