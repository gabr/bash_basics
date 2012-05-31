#!/bin/bash

TEMP_FILE=/tmp/printfile.txt

clean_up()
{
  rm $TEMP_FILE
    exit
}

# trap -l for complite list of signals
trap clean_up SIGHUP SIGINT SIGTERM

pr $1 > $TEMP_FILE

echo -n "Print file? [y/n]: "
read
if [ "$REPLY" = "y" ]; then
    less $TEMP_FILE
fi
rm $TEMP_FILE

