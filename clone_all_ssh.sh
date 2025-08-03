#!/bin/bash
# Script to clone all existing samples

# CLONEFOLDER <project name> <directory> clones or pulls the nvpro-sample with
# the given name to a folder with that name under the given directory.
CLONEFOLDER() {
  echo "--------------------------------------------"
  if [ ! -d "$2/$1" ]
  then
    git clone --recursive -- git@github.com:nvpro-samples/$1.git $2/$1
  else
    echo "$2/$1 already there... pulling"
    git -C $2/$1 pull
    git -C $2/$1 submodule update --init --recursive
  fi
}

# Clone the v1 and v2 nvpro_core repos
CLONEFOLDER nvpro_core .
CLONEFOLDER nvpro_core2 .

# For each project listed in project_data.csv, clone it into the samples/ folder
while IFS=, read -r project version; do
  CLONEFOLDER $project samples
done < project_data.csv

exit 0
