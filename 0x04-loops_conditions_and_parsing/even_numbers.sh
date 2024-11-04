#!/usr/bin/env bash
# This script prints even numbers from 1 to 20

for ((i=1; i<=20; i++)); do
    if (( i % 2 == 0 )); then
        echo $i
    fi
done
