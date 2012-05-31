#!/bin/bash

a=0 ; b=0

echo -n "Enter the a value: " ; read a
echo -n "Enter the b value: " ; read b

echo "a + b = $(( a+b ))"
echo "a - b = $(( a-b ))"
echo "a * b = $(( a*b ))"
echo "a / b = $(( a/b ))"
echo "a % b = $(( a%b ))"
echo "a^b = $(( a**b ))"
