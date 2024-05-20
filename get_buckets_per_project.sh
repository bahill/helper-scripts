#!/opt/homebrew/bin/bash

for bucket in `gcloud alpha storage buckets list --project=dsp-data-ingest --format="json(name)" | jq -r  ".[].name"`
 do size=`gsutil du -s gs://$bucket 2>&1 | awk '{print $1}'`
 echo "$project,$bucket,$size"
done | tee output.csv
