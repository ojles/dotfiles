#!/bin/bash

cleanup() {
    echo "Removing files in $(pwd)"
    rm -rf node_modules target build
    for ddd in $(ls)
    do
        if [ -d $ddd ]; then
            cd $ddd
            cleanup
            cd ../
        fi
    done
}

cd $1
cleanup
