#!/bin/bash

# Script: ops 201 class 04 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 02/23/23
# Purpose: Creating four directories dir1, dir2, dir3, dir4
# Place names of directories into an array
# References array variable to create a file in each directory

dir_list=("dir1" "dir2" "dir3" "dir4")

#Main


mkdir ${dir_list[*]}

touch ${dir_list[0]}/tea.txt
touch ${dir_list[1]}/tea.txt
touch ${dir_list[2]}/tea.txt
touch ${dir_list[3]}/tea.txt


#End