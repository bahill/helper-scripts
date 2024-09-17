#!/bin/bash

sort -u broad-dsp-monster-hca-prod-ebi-storage_list_20240917.csv > broad-dsp-monster-hca-prod-ebi-storage_list_20240917_dedup.csv
grep -v '/:,' broad-dsp-monster-hca-prod-ebi-storage_list_20240917_dedup.csv > broad-dsp-monster-hca-prod-ebi-storage_list_20240917_cleanup.csv