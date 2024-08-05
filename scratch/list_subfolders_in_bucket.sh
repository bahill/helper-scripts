#!/bin/bash

current_date=$(date +%Y%m%d) # get current date in YYYYMMDD format

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File $1 not found"
    exit 1
fi

# Add a newline character at the end of the file
echo >> "$1"

# Read the file line by line
while IFS= read -r bucket || [ -n "$bucket" ]; do
    echo "$bucket"
    #get size of bucket
    # List subfolders in the bucket
    subfolder=$(gcloud storage ls "$bucket")
    echo "$subfolder" > tmp_folder_list.txt
#      while IFS= read -r subfolder || [ -n "$subfolder" ]; do
#        echo "$subfolder"
#        gcloud ls "$subfolder" >> "${bucket}_${current_date}.csv"
#        # gcloud ls $subfolder >> "${bucket}_${current_date}_${size}.txt"
#      done < tmp_folder_list.txt
done < "$1"




