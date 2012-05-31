#!/bin/bash

echo -n "Enter some text > "
read text
echo "You entered: $text"

echo -n -e "Hurry up and type something!\n > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow to see the secret message ;p"
fi

echo -n -e "\nYou can now type your password (it wont be visible to you)\n #pass: "
read -s pass
echo -e "\nyour password is: ****"
