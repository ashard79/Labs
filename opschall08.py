#!/usr/bin/env python3


# Script: ops 301 class 08 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 05/18/23
# Purpose: Crrate a python script that
# Assign to a variable a list of ten string elements.
# Print the fourth element of the list.
# Print the sixth through tenth element of the list.
# Change the value of the seventh element to “onion”.
# Create one tuple. Create one set. Create one dictionary.
# remove()
# reverse()
# sort()
# append()
# clear()
# copy()
# count()
# extend()
# index()
# insert()



# Main

import time

# Created tuple
my_fruits = ["apples", "pears", "grapes", "watermelon", "strawberrys", "oranges", "bannanas", "cherrys",
            "plums","pineapples"]
# Created Set
my_teams = {"jets", "yankees", "knicks", "cubs", "nets", "bills", "mets", "heat", "magic", "rams"}

# created dictionary
my_life = {

    'Name': 'Osaremeh',
    'sports': 'Football',
    'Hobbies': 'Music',
    'movie': 'Malcolm x',

}

print("fruit list.")
# Printed list
print(my_fruits)
# Printed fourth element of the list
print(my_fruits[3], "!")
# Printed the sixth through tenth element of the list.
print(my_fruits[5:10])
# Change the value of the seventh element to “onion”.
my_fruits.remove("bannanas")
my_fruits.insert(6, "onions")
time.sleep(2)
print(my_fruits)
# Append list
my_fruits.append("Grapefruits")
print(my_fruits)
# reverse list
my_fruits.reverse()
print(my_fruits)
# count within the list
my_fruits.count(2)



# End



z