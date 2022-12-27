#!/bin/bash

rm -rf .home
for f in $HOME/*; do
    mkdir -p .home/$(basename $f)
done

