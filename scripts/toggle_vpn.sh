#!/bin/bash

# Define the interface name
INTERFACE="wg0"

# Check if the interface exists
if ip link show $INTERFACE > /dev/null 2>&1; then
    # If it exists, turn it off
    sudo wg-quick down $INTERFACE
    notify-send "WireGuard" "Tunnel Deactivated - Traffic is now public" -i network-wireless
else
    # If it doesn't exist, turn it on
    sudo wg-quick up $INTERFACE
    notify-send "WireGuard" "Tunnel Activated - Traffic is now encrypted" -i network-vpn
fi
