#!/bin/bash
set -e

reset

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

if [ "$(id -u)" != "0" ]; then
  echo -e "${CYAN}[Bastion]: ${ORANGE}[ERROR] Bastion BOT Installer requires root permissions.${NC}"
  hash sudo &>/dev/null || (echo -e "${CYAN}[Bastion]: ${NC} Run this installer with root permissions.\n" && exit 1)
  sudo ./update.sh
  exit 1
fi

echo -e "${CYAN}[Bastion]:${NC} Updating Bastion BOT..."
git pull origin master 1>/dev/null || (echo -e "${CYAN}[Bastion]: ${NC} Unable to update the bot.\n" && exit 1)
echo -e "${CYAN}[Bastion]:${NC} Done."
echo

if [ -d node_modules ]; then
    echo -e "${CYAN}[Bastion]:${NC} Deleting old dependencies..."
    rm -r node_modules
    echo -e "${CYAN}[Bastion]:${NC} Done."
    echo -e "${CYAN}[Bastion]:${NC} Installing new dependencies... This may take a while, please be patient."
    npm install &>/dev/null
    echo -e "${CYAN}[Bastion]:${NC} Done."
    echo -e "${CYAN}[Bastion]:${NC} Ready to boot up and start running."
fi
echo