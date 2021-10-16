#!/bin/bash

function is_diff_contain () {
    diff_list=`git diff --name-only remotes/origin/$1 remotes/origin/$2 | sed -ze 's/\n/,/g'`
    target_list="$3"
    
    for target in ${target_list//,/ }; do
    if [[ $diff_list == *"$target"* ]]; then
        echo "true"
        return 0
    fi
    done
    echo "false"
    return 1
}

echo "execute differential build"
flag=`is_diff_contain $HEAD_REF $BASE_REF "src/"`

if [[ "true" == $flag ]]; then
    echo "build and test source"
fi