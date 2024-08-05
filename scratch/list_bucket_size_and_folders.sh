#!/bin/bash

project=$1 #insert project name here
current_date=$(date +%Y%m%d) # get current date in YYYYMMDD format

for bucket in $(gcloud storage ls --project="$project")
  do size=$(gcloud storage du "$bucket" --summarize 2>&1 | cut -d' ' -f1 | awk '{print $1/1073741824}') # convert bytes to GB
  echo "$project,$bucket,$size"
  done >> "${project}_sizes_${current_date}.csv"