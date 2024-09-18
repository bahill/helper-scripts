#!/bin/bash

bucket=broad-dsp-monster-hca-prod-ucsc-storage
current_date=$(date +%Y%m%d)
temp_file="${bucket}_sizes_${current_date}_temp.csv"
final_file="${bucket}_sizes_${current_date}.csv"

for folder in $(gcloud storage ls gs://${bucket}); do
 for subfolder in $(gcloud storage ls "$folder"); do
   size=$(gcloud storage du "$subfolder" --summarize 2>&1 | awk '{print $1/1073741824}') # convert bytes to GB
   echo "$subfolder,$size"
 done
done >> "${bucket}_list_${current_date}_temp.csv"

#remove duplicate rows & object listing
sort -u "$temp_file" | grep -v '/:,' > "$final_file"

rm "$temp_file"

#TODO input a list of buckets