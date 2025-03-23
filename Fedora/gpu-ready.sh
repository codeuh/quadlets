#!/bin/bash

while ! ls /dev/nvidia0 &>/dev/null; do
    sleep 1
done

nvidia-smi

if ! ls /dev/nvidia-uvm &>/dev/null; then
    sleep 5
fi