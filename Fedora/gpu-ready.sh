#!/bin/bash

# Check if /dev/nvidia0 and /dev/nvidia-uvm exist
while ! ls /dev/nvidia0 &>/dev/null || ! ls /dev/nvidia-uvm &>/dev/null; do
    sleep 1
done