#!/bin/bash
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk usage: $DISK%"
if [ $DISK -gt 80 ]; then
    echo "Warning! Disk almost full!"
else
    echo "Disk OK"
fi
