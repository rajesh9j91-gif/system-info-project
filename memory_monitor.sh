#!/bin/bash
RAM=$(free | awk '/^Mem:/ {printf "%d", $3/$2*100}')
echo "Memory usage: $RAM%"
if [ $RAM -gt 80 ]; then
    echo "Warning! Memory High!"
else
    echo "Memory OK"
fi 
