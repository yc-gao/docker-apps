#!/bin/bash
set -e

rm -rf .home
for f in $HOME/*; do
    mkdir -p .home/$(basename "$f")
done

echo "init success"

