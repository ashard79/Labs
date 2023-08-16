#!/usr/bin/env python3
# Script: ops 401 class 03 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 08/07/23
# Purpose: Ask the user for an email address and password to use for sending notifications.
#...Send an email to the administrator if a host status changes (from “up” to “down” or “down” to “up”).
#...Clearly indicate in the message which host status changed, the status before and after, and a timestamp of the event.

# Main


# Libraies imported
import requests
import smtplib
import getpass
import time
import os, datetime, time
import subprocess



# Defining the funtion and loop counter
def ping_destination(destination_ip, max_loops=5):
    try:
        loop_count = 0
        while loop_count < max_loops:
# Timestamp set            
            timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
            try:
                result = subprocess.run(['ping', '-c', '1', '-W', '1', destination_ip], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, timeout=5)
                if result.returncode == 0:
                    status = "Success"
                else:
                    status = "Failure"
            except subprocess.TimeoutExpired:
                status = "Failure"

            print(f"{timestamp} - Destination: {destination_ip} - Status: {status}")
            time.sleep(2)
            loop_count += 1

    except KeyboardInterrupt:
        print("Ping loop stopped.")

if __name__ == "__main__":
    # Running ping then stops loop after 5
    destination_ip = '8.8.8.8'
    ping_destination(destination_ip, max_loops=5)


# Function to send email notifications
def send_notification(sender_email, sender_password, recipient_email, subject, message):
    try:
        # Connect to the SMTP server
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(sender_email, sender_password)

        # Compose email
        email_message = f"Subject: {subject}\n\n{message}"

        # Send email
        server.sendmail(sender_email, recipient_email, email_message)

        # Close connection
        server.quit()
    except Exception as e:
        print("Error sending email:", e)

# Function to update host status
def update_host_status(host_status, host_name):
    if host_status == "up":
        return "down", f"{host_name} is now down"
    else:
        return "up", f"{host_name} is now up"

# Main function
def main():
    sender_email = input("Enter your email address: ")
    sender_password = input("Enter your email password: ")
    recipient_email = input("Enter recipient's email address: ")
    
    # Simulate host status changes for demonstration
    host_status = "up"
    host_name = "example.com"
    
    while True:
        new_status, message = update_host_status(host_status, host_name)
        
        if new_status != host_status:
            current_time = time.strftime("%Y-%m-%d %H:%M:%S")
            subject = f"Host Status Change: {host_name} is {new_status.upper()}"
            notification_message = (
                f"Host: {host_name}\n"
                f"Status Change: {host_status.upper()} -> {new_status.upper()}\n"
                f"Timestamp: {current_time}"
            )
            
            send_notification(sender_email, sender_password, recipient_email, subject, notification_message)
        
        host_status = new_status
        time.sleep(10)  # Simulate checking status every 10 seconds

if __name__ == "__main__":
    main()


  


