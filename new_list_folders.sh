#!/bin/bash

bucket=broad-dsp-monster-hca-prod-ucsc-storage
current_date=$(date +%Y%m%d) # get current date in YYYYMMDD format

for folder in $(gcloud storage ls gs://${bucket})
 do subfolders=$(gcloud storage ls "$folder")
 echo "$subfolders"
done >> "${bucket}_list_${current_date}.csv"

#TODO add size to top bucket & ability to have input be a list of buckets