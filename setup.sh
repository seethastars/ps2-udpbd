#!/bin/bash

# set script to exit on error
set -e

# variables
RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
BLUE='\e[34m'

while :
do
  read -p "This is a script for Installing PS2-UPDBD server dependencies on Arch Linux, would you like to proceed? (y/n): " resp  # user response

    if [[ $resp =~ ^[Nn]$ ]]; then
      exit 1

    elif [[ $resp =~ ^[Yy]$ ]]; then

      echo -e "${YELLOW}Installing dependencies...${RC}"

      # Note: you can use 'gparted' instead of partitionmanager for making the exFAT partition.
      paru -Syu 'dotnet-runtime-8 exfatprogs partitionmanager'

      echo -e "${GREEN}Dependencies installed.\n${RC}"

      echo -e "${YELLOW}Cloning the udpbd-server repo and compiling it...${RC}"
      git clone https://gitlab.com/ps2max/udpbd-server.git
      cd udpbd-server/
      make
      cd ..

      echo -e "${GREEN}Done! Now follow the guide on Github.\n${RC}"

      echo -e "${RED}Please type Y for confirm or N for decling (^C to quit.)${RC}"
    fi 
done
