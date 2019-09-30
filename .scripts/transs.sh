#!/bin/bash

DICTIONARY="$HOME/.scripts/eng-words"

throw() {
    echo "ERROR: $1"
    exit 1
}

save_to_dictionary() {
    echo "$1" >> $DICTIONARY
}

if [ $# -le 0 ]
then
    throw 'No parameters specified'
fi

if [ $# -gt 1 ]
then
    throw 'Too many parameters'
fi

if [ ! -e $DICTIONARY ]
then
    touch $DICTIONARY
fi

trans -shell en:uk "$1" && save_to_dictionary "$1"
