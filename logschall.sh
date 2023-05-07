#!/bin/bash

# Script: ops 301 class 05 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/05/23
# Purpose: Write a bash script that clears a log file.
# Print to the screen the file size of the log files before compression
# Compress the contents of the log files to a backup directory
# File name should contain time stamp with the following format -YYYYMMDDHHMMSS
# Clear the contents of the log file
# Print to screen the file size of the compressed file
# Compare the size of the compressed files to the size of the original log files


#Main

# How to view a file's contents


sys_files=(stars.txt)

 # Define back up dir
BACKUP_DIR="starwarsbackup"

 # Define format for time stamp
TIMESTAMP=$(date +"s%m%d%Y")

 # loop file then compress it to back up directory
for file in "${sys_files[@]}"; do

 # getting file size befor compression
  FILE_SIZE=$( wc -c "$file" | awk '{print $1')

 # zip the file to the backup directory with the timestamp
  FILE_NAME=$(basename "$file")

  zip -r "$BACKUP_DIR/$FILE_NAME-$TIMESTAMP.zip" "$file"

 # print out a confirmation that file is being zipped
echo "Compressing $BACKUP_DIR/$FILE_NAME-$TIMESTAMP.zip"

 # clear the contents of the log file
  cat /dev/null > "$file"

 # get the file size after compression
COMPRESSED_FILE_SIZE=$(wc -c "$BACKUP_DIR/$FILE_NAME-$TIMESTAMP.zip" | awk '{print $1}')

 # print the file size before and after compression
  echo "File size before compression: $FILE_SIZE"
  echo "File size after compressions: $COMPRESSED_FILE_SIZE"

 # Compare the file size before and after compression is done
  if [[ $FILE_SIZE -gt $COMPRESSED_FILE_SIZE ]]; then
 
 echo "Compressions successful: compressed file size is smaller than original file size"
  else
    echo "Compression unsuccesful: compressed file size is larger than original file size"
  fi

done
