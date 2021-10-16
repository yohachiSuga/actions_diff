#!/bin/bash

diff_list=".github/workflows/a.yaml"
target_list=".github/"

echo diff list is $diff_list
echo target list is $target_list

for target in ${target_list//,/ }; do
    if [[ $diff_list == *"$target"* ]]; then
        echo "target found"  
        echo "::set-output name=is_contain::true"
        exit 0
    fi
done
echo "no target found "
