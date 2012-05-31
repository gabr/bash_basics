#!/bin/bash

pause()
{
 echo -en "\nPress Enter to continue..."
 read
 clear
}

selection=
clear
until [ "$selection" = "0" ]; do
    echo "
    SCRIPT MENU
    1 - Display free disk space
    2 - Display free memory

    0 - exit script

    "
    echo -n " : " ; read selection
    clear
    echo ""
    case $selection in
        1 ) df ;;
        2 ) free ;;
        0 ) exit ;;
        * ) echo "BAD COMMAND. Try again!"; pause
    esac
done
