#!/usr/bin/env python3


# Script: ops 301 class 09 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/20/23
# Purpose: Create if statements using logical conditionals
# Create an if statement using a logical conditional of your choice
# and include elif keyword that executes when other conditions are not met.
# Create an if statement that includes both elif and else to execute when both if 
# and elif are not met.
# Each statement should print information to the screen depending on if the condition is met.
# Equals: a == b
# Not Equals: a != b
# Less than: a < b
# Less than or equal to: a <= b
# Greater than: a > b
# Greater than or equal to: a >= b


# Varible
sports = "Basketball"
big = "center"
mvp = "Best Player"
points = 30
rebounds = 10
asisst = 7

# Main

# if statement
if mvp == "Best Player":
    print("Joel Embiid is the MVP")
    
elif rebounds <= 10:
    print("great job on the boards")


# else to execute when both if and elif are not met.
if points < 15:
    print("You cant be serious!! HAHAHA")

elif points >= 30:
    print("You might be beter than the current MVP")

else:
    print("You're in a good sweet spot")   


# End