#!/bin/bash

pushd ..
for dir in *; do
   for file in "$dir"; do
     pushd $file
     git pull
     popd
   done
done
popd
