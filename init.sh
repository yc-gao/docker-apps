#!/bin/bash

rm -rf .home
for f in $HOME/*; do
    if [ -d $f ]; then
        mkdir -p .home/$(basename $f)
    fi
done

mkdir -p .home/.config

