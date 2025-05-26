conda activate cpath

encoders=(
    "virchow"
)

subsets=(
    "gbm"
    "lgg"
    "luad"
    "lusc"
)

for encoder in "${encoders[@]}"; do
    for subset in "${subsets[@]}"; do
        python run_batch_of_slides.py --task all --wsi_dir /large_storage/hielab/abuen/data/cpath/$subset/wsis --job_dir ./trident_processed_$subset --patch_encoder $encoder --mag 20 --patch_size 512
    done
done