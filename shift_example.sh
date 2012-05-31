#!/bin/bash

echo -n '$# = ' ; echo "$#"

while [ "$1" != "" ] ; do
    echo "Parameter 1 equals $1"
    echo -n '$# = ' ; echo "$#"

    shift
done
