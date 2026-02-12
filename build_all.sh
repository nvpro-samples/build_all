#!/bin/bash

# configure and build each downloaded sample

# Set the base directory to the current directory
base_dir="./samples"

# Define an array of directories to exclude
excluded_dirs=("vk_video_samples" )

# Store the current directory to return later
current_dir=$(pwd)

# Iterate over subdirectories
for dir in "$base_dir"/*/; do
  # Remove trailing slash
  dir_name=$(basename "$dir")

  # Check if the directory is in the excluded list
  if [[ " ${excluded_dirs[@]} " =~ " ${dir_name} " ]]; then
    echo "Skipping Directory: $dir_name"
    continue  # Skip this directory
  fi

  echo "Processing Directory: $dir_name"

  # configure into build subdir
  cmake -S $dir -B $dir/build

  # compile
  cmake --build $dir/build --config Release
done
