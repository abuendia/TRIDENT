conda activate cpath

encoders=(
    "uni_v1"
    "conch_v1"
    "virchow"
)

subsets=(
    "luad"
    "lusc"
)

for encoder in "${encoders[@]}"; do
    for subset in "${subsets[@]}"; do
        python ../run_batch_of_slides.py --task all --wsi_dir /oak/stanford/groups/jamesz/abuen/cpath/TRIDENT/raw_wsi/$subset --job_dir ../trident_processed_$subset --patch_encoder $encoder --mag 20 --patch_size 512
    done
done