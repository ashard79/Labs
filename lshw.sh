# Script: ops 201 class 07 Ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 03/06/23
# Purpose: Uses lshw to display system information to the screen about the following components:
# Name of the computer, CPU, Ram, Display Adapter, Network Adapter, 

#Main


echo "***Name of CPU"
whoami
echo ""

echo "***CPU"
lshw | grep -A6 "*-cpu"
echo""

echo "***Ram"
sudo lshw -c memory | grep -A3 -i "*-memory"
echo""

echo "***Display Adapter"
sudo lshw -C display | grep -v "logical name" | grep -v "version"
echo ""

echo "***Network Adapter"
sudo lshw -C network 


#End




