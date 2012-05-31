#!/bin/bash

if [ "$#" != 1 ]; then
    echo "usage: cout_chars.sh filename"
    exit 1
else
    cout=0
    for i in $(cat $1); do
        count=$((coutn+1))
        echo "Word $coutn ($i) contains $(echo -n $i | wc -c) characters"
    done
fi
