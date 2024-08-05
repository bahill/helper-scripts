#!/bin/bash

project=broad-dsp-monster-hca-dev

for bucket in $(gcloud alpha storage buckets list --project=$project --format="json(name)" | jq -r  ".[].name")
 do size=$(gsutil du -s gs://"$bucket" 2>&1 | awk '{print $1/1099511627776}') # convert bytes to TB
 echo "$project,$bucket,$size"
done >> broad-dsp-monster-hca-dev_sizes_080524.csv

