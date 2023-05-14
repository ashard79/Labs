#!/usr/bin/env python3


import os
cwd = os.getcwd()
print(cwd)


import subprocess

# Execute the 'whoami' command and capture its output
output = subprocess.check_output(['whoami'])

# print it
print(output)


import subprocess

# Execute the 'ip a' command and capture its output
output = subprocess.check_output(['ip', 'a'])

# output to a string and print it
print(output.decode('utf-8'))

import subprocess

# Execute the 'lshw -short' command and capture its output
output = subprocess.check_output(['lshw', '-short'])

# Decode the output to a string and print it
print(output.decode('utf-8'))

