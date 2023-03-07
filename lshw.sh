# Script: ops 201 class 07 Ops Challenge
# Author: Osaremeh Abel
# Date of latest revision: 03/06/23
# Purpose: Uses lshw to display system information to the screen about the following components:
# Name of the computer, CPU, Ram, Display Adapter, Network Adapter, 


echo "***Name of CPU"
whoami
echo ""
echo ""

echo "***CPU"
sudo $(lshw | grep -B5 "CPU")
echo ""
echo ""

echo "***Ram"
sudo lshw -C memory
echo ""
echo ""


echo "***Display Adapter"
sudo lshw -C display
echo ""
echo ""

echo "***Network Adapter"
sudo lshw -C network
echo ""

echo $(lshw | grep )




















# Main









# End