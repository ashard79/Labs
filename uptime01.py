#!/usr/bin/python3
# Script: ops 401 class 02 ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 07/18/23
# Purpose: Transmit a single ICMP (ping) packet to a specific IP every two seconds.
# Evaluate the response as either success or failure.
# Assign success or failure to a status variable.
# For every ICMP transmission attempted, print the status variable along with a comprehensive timestamp and destination IP tested.


#import os, datetime, time

# Main


# Preforming one ping
#espn = "192.234.2.11"

#ping = os.system("ping -c" + espn)
#print(ping)
#time.sleep(2)

# Libraies imported
import subprocess
import time

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

