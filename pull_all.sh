#!/bin/bash

git -C nvpro_core pull --recurse-submodules
git -C nvpro_core2 pull --recurse-submodules

# Walks through downloaded samples and pulls latest changes
# Note: doesn't take care of possible conflicts
for dir in samples/*; do
  echo git -C $dir pull --recurse-submodules
  git -C $dir pull --recurse-submodules
done
