#!/bin/bash

# configure and build each downloaded sample

# Set the base directory to the current directory
base_dir=".."

# Define an array of directories to exclude
excluded_dirs=("build_all" "downloaded_resources" "nvpro_core" "bin_x64" "vk_video_samples")

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

  # Change into the directory
  cd "../$dir_name" || { echo "Failed to enter ../$dir_name"; exit 1; }

  # configure into build subdir
  cmake -S . -B build

  # compile
  cmake --build build --config Release

  # Move back to the original directory
  cd "$current_dir" || { echo "Failed to return to $current_dir"; exit 1; }
done
