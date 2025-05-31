#!/bin/bash

bucket="s3://cpath-eval"
base_local="/oak/stanford/groups/jamesz/abuen/cpath/TRIDENT/to_s3"
cancers=("gbm" "lgg" "luad" "lusc")

for cancer in "${cancers[@]}"; do
    local_path="${base_local}/${cancer}/"
    s3_path="${bucket}/${cancer}/"

    echo "Syncing ${local_path} -> ${s3_path}"
    aws s3 sync "${local_path}" "${s3_path}" --exact-timestamps
done