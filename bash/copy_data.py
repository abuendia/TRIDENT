import os
import shutil
from glob import glob
from tqdm import tqdm

# Define base paths and parameter sets
base_src = "/oak/stanford/groups/jamesz/abuen/cpath/TRIDENT/trident_processed_{cancer}/20x_512px_0px_overlap/features_{model}"
base_dst = "/oak/stanford/groups/jamesz/abuen/cpath/TRIDENT/to_s3/{cancer}/features_{model}/h5_files"

cancer_types = ["gbm", "lgg", "luad", "lusc"]
model_names = ["conch_v1", "uni_v1", "plip", "virchow", "musk"]

# Collect all files to copy first for progress bar
all_file_pairs = []

for cancer in cancer_types:
    for model in model_names:
        src_dir = base_src.format(cancer=cancer, model=model)
        dst_dir = base_dst.format(cancer=cancer, model=model)

        # Find all .h5 files
        h5_files = glob(os.path.join(src_dir, "*.h5"))
        for file_path in h5_files:
            all_file_pairs.append((file_path, dst_dir))

# Copy with progress bar
for file_path, dst_dir in tqdm(all_file_pairs, desc="Copying .h5 files", unit="file"):
    os.makedirs(dst_dir, exist_ok=True)
    shutil.copy(file_path, dst_dir)
