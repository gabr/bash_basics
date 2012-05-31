#!/bin/bash

echo -n "Type a digit or a letter : "
read char
case $char in
        [[:lower:]] | [[:upper:]] ) echo "You typed the letter $char" ;;
        [0-9] )                     echo "You typed the digit $char" ;;
        * )                         echo "You didn't type a letter or a digit"
esac
