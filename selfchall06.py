#!/usr/bin/python3

# Script: ops 401 class 06/07 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 10/17/23
# Purpose: In Python, create a script that utilizes the cryptography library to:

# Prompt the user to select a mode:
# Encrypt a file (mode 1)
# Decrypt a file (mode 2)
# Encrypt a message (mode 3)
# Decrypt a message (mode 4)

# If mode 1 or 2 are selected, prompt the user to provide a filepath to a target file.
# If mode 3 or 4 are selected, prompt the user to provide a cleartext string.

# Encrypt the target file if in mode 1.
# Delete the existing target file and replace it entirely with the encrypted version.
# Decrypt the target file if in mode 2.
# Delete the encrypted target file and replace it entirely with the decrypted version.
# Encrypt the string if in mode 3.
# Print the ciphertext to the screen.
# Decrypt the string if in mode 4.
# Print the cleartext to the screen.

# Recursively encrypt a single folder and all its contents.
# Recursively decrypt a single folder that was encrypted by this tool.

# Main

# importing from cryptography library
from cryptography.fernet import Fernet
import os
import random

# Generated a key for encrypt/decrypt
key = Fernet.generate_key()
cipher_suite = Fernet(key)

# defines function encrypt_file which takes a file_path parameter.
def encrypt_file(file_path):
    with open(file_path, 'rb') as file:
        file_data = file.read()
    encrypted_data = cipher_suite.encrypt(file_data)
    with open(file_path, 'wb') as file:
        file.write(encrypted_data)


def decrypt_file(file_path):
    with open(file_path, 'rb') as file:
        encrypted_data = file.read()
    decrypted_data = cipher_suite.decrypt(encrypted_data)
    with open(file_path, 'wb') as file:
        file.write(decrypted_data)

# encrypts the message after converting it to bytes using the encode() method
def encrypt_message(message):
    encrypted_message = cipher_suite.encrypt(message.encode())
    print("Encrypted message:", encrypted_message)

def decrypt_message(encrypted_message):
    decrypted_message = cipher_suite.decrypt(encrypted_message).decode()
    print("Decrypted message:", decrypted_message)

 # prints the mode selected.
def main():
    print("Select Mode:")
    print("1. Encrypt a file")
    print("2. Decrypt a file")
    print("3. Encrypt a message")
    print("4. Decrypt a message")
# prompts user to enter a mode and stores input.
    mode = int(input("Enter mode: "))

    if mode in [1, 2]:
        file_path = input("Enter the file path: ")
        if mode == 1:
            encrypt_file(file_path)
            print("File encrypted successfully.")
        else:
            decrypt_file(file_path)
            print("File decrypted successfully.")
    elif mode in [3, 4]:
        message = input("Enter the message: ")
        if mode == 3:
            encrypt_message(message)
        else:
            encrypted_message = input("Enter the encrypted message: ").encode()
            decrypt_message(encrypted_message)
    else:
        print("Invalid mode selected.")

if __name__ == "__main__":
    main()

# To encrypt Folder
  def encrypt_random_folder(directory, key):
    folders = [f.path for f in os.scandir(directory) if f.is_dir()]
    if not folders:
        print("No folders found in the specified directory.")
        return

    random_folder = random.choice(folders)
    print(f"Selected folder for encryption: {random_folder}")
    encrypt_directory(random_folder, key)

def encrypt_directory(directory, key):
    for foldername, subfolders, filenames in os.walk(directory):
        for filename in filenames:
            file_path = os.path.join(foldername, filename)
            encrypt_file(file_path, key)
            print(f'Encrypted: {file_path}')

 # To decrypt the folder
def decrypt_file(file_path, key):
    cipher_suite = Fernet(key)
    with open(file_path, 'rb') as file:
        encrypted_data = file.read()
    decrypted_data = cipher_suite.decrypt(encrypted_data)
    with open(file_path, 'wb') as file:
        file.write(decrypted_data)

def decrypt_directory(directory, key):
    for foldername, subfolders, filenames in os.walk(directory):
        for filename in filenames:
            file_path = os.path.join(foldername, filename)
            decrypt_file(file_path, key)
            print(f'Decrypted: {file_path}')

with open('encryption_key.key', 'rb') as key_file:
        key = key_file.read()
  

#end