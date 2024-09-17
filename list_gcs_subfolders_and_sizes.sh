#!/bin/bash

bucket=broad-dsp-monster-hca-prod-ebi-storage
current_date=$(date +%Y%m%d)

for folder in $(gcloud storage ls gs://${bucket}); do
 for subfolder in $(gcloud storage ls "$folder"); do
   size=$(gcloud storage du "$subfolder" --summarize 2>&1 | awk '{print $1/1073741824}') # convert bytes to GB
   echo "$subfolder,$size"
 done
done >> "${bucket}_list_${current_date}.csv"

#TODO input a list of buckets