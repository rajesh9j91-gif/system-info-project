#!/bin/bash
echo "===== Full System Monitor ====="
 
# System Info
echo "User: $(whoami)"
echo "Uptime: $(uptime -p)"
 
# CPU
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
echo "CPU usage: $CPU%"
if [ $CPU -gt 70 ]; then
    echo "Warning! CPU High!"
else
    echo "CPU OK"
fi
 
# Memory
RAM=$(free | awk '/^Mem:/ {printf "%d", $3/$2*100}')
echo "Memory usage: $RAM%"
if [ $RAM -gt 80 ]; then
    echo "Warning! Memory High!"
else
    echo "Memory OK"
fi
 
# Disk
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk usage: $DISK%"
if [ $DISK -gt 80 ]; then
    echo "Warning! Disk Full!"
else
    echo "Disk OK"
fi
 
echo "=============================="
