#!/bin/bash

# --- Color Codes for pretty output ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[*] Starting Hardened Infrastructure Client Setup...${NC}"

# 1. Install Dependencies
echo -e "${GREEN}[1/4] Installing WireGuard and OpenResolv...${NC}"
sudo pacman -S --needed wireguard-tools openresolv

# 2. Fix DNS Signature Issues
echo -e "${GREEN}[2/4] Initializing resolvconf for DNS management...${NC}"
# This solves the 'unknown signature' error we encountered earlier
sudo resolvconf -u

# 3. Setup Sudo Permissions for the Toggle Script
echo -e "${GREEN}[3/4] Checking sudoers permissions...${NC}"
if sudo grep -q "wg-quick" /etc/sudoers; then
    echo "Sudoers rule already exists."
else
    echo -e "${BLUE}Please add the following line to your /etc/sudoers using 'sudo visudo':${NC}"
    echo -e "${GREEN}$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/wg-quick${NC}"
fi

# 4. Make Toggle Script Executable
echo -e "${GREEN}[4/4] Setting permissions on scripts...${NC}"
chmod +x ./toggle_vpn.sh

echo -e "${BLUE}[!] Setup Complete. Place your wg0.conf in /etc/wireguard/ and press your i3 keybind.${NC}"
