#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
echo "CPU usage: $CPU%"
if [ $CPU -gt 70 ]; then
    echo "Warning! CPU High!"
else
    echo "CPU OK"
fi
