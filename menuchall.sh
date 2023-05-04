#!/bin/bash

# Script: ops 301 class 04 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/2/23
# Purpose: Create a bash script that launches a menu system 
#..... with use of a conditional statement to evaluate the user’s input

#Main


# Created loop
while true; do
  clear
# Menu Displayed
  echo "Please choose an option"
  echo "1. Print Hello World!"
  echo "2. Ping this computer"
  echo "3. Get IP Info"
  echo "4. Exit"
  read choice  

# If option 1 is choosen, then Hello World is printed
if [[ $choice == 1 ]]; then
  echo "Hello World!"
# Asking user to press enter to continue
  read -p "Press Enter to continue"
# If option 2 is choosen, then system will self ping then print results
elif [[ $choice == 2 ]]; then
  result=$(ping -c1 $(hostname))
        echo "Ping result: $result"
# Asking user to press enter to continue        
  read -p "Press Enter to continue"
# If option 3 is choosen, then system will show IP info  
elif [[ $choice == 3 ]]; then
  IP=$(ip addr show)
        echo "your IP information: $IP"
# asking user to press enter to continue       
  read -p "Press Enter to continue"
# If option 4 is choosen, then program will exit  
 elif [[ $choice == 4 ]]; then
 # Prints goodbye on screen
  echo "Thank you, Goodbye!"
  exit 0
 else
 # Prints on screen if entry is incorrect
  echo "That entry is invalid! Please try again"
  # Prints for user to press enter to continue
  read -p "Press enter to continue"
fi

done

# End







