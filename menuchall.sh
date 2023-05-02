#!/bin/bash

# Script: ops 301 class 04 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/2/23
# Purpose: Create a bash script that launches a menu system 
#..... with use of a conditional statement to evaluate the user’s input

#Main

# Set varible

apples="ping 127.0.0.1"
pears="ifconfig -a"       

while true; do
  clear
  echo "Please choose an option"
  echo "1. Print Hello World!"
  echo "2. Ping this computer"
  echo "3. Get IP Info"
  echo "4. Exit"
  read choice  


if [[ $choice == 1 ]]; then
  echo "Hello World!"
  read -p "Press Enter to continue"
elif [[ $choice == 2 ]]; then
  echo "$apples"
  read -p "Press Enter to continue"
elif [[ $choice == 3 ]]; then
  echo "$pears"
  read -p "Press Enter to continue"
 elif [[ $choice == 4 ]]; then
  echo "Thank you, Goodbye!"
  exit 0
 else
  echo "That entry is invalid! Please try again"
  read -p "Press enter to continue"
fi

done

  







