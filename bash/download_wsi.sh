#!/bin/bash
set -e 

subsets=(
    "brca"
    "gbm"
    "lgg"
    "luad"
    "lusc"
)

for subset in "${subsets[@]}"; do
    echo "Downloading ${subset} data..."
    aws s3 sync s3://cpath-eval/${subset}/ /oak/stanford/groups/jamesz/abuen/cpath/TRIDENT/raw_wsi/${subset}/
done
