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
  read -p "This is a script for installing and setup a PS2-UPDBD server, would you like to proceed? (y/n): " resp      # user response

    if [[ $resp =~ ^[Nn]$ ]]; then
      exit 1

    elif [[ $resp =~ ^[Yy]$ ]]; then

      echo -e "${YELLOW}Installing dependencies...${RC}"

      # Note: you can use 'gparted' instead of partitionmanager for making the exfat partition.
      #ps2_pkgs='dotnet-runtime-8.0 exfatprogs partitionmanager'

      #paru -Syu $ps2_pkgs

      echo -e "${GREEN}Packages installed.\n${RC}"

      echo -e "${YELLOW}Cloning the udpbd-server repo and compiling it...${RC}"
      #git clone https://gitlab.com/ps2max/udpbd-server.git
      #cd updbd-server/
      #make

      echo -e "${GREEN}Done! Now follow these steps:\n${RC}"
      echo -e "1. Open up paritionmanager and create a new exfat partition, in my case i have an NVME SSD so it most likely will be /dev/nvme0n1p3."
      echo -e "2. Then mount the new partition in /mnt/ps2/:\n"
      echo -e "sudo mkdir /mnt/ps2/\n"
      echo -e "sudo mount /dev/nvme0n1p3 /mnt/ps2/ -o uid=$USER\n"
      echo -e "3. Create folders named 'CD' and 'DVD' in /mnt/ps2/."
      echo -e "4. Rip/copy your PS2 disc images into the folders that corresponds with their original source media."
      echo -e "Example: /mnt/ps2/DVD/Grand Theft Auto III.iso"
      echo -e "5. Download the latest realease from: 'https://github.com/sync-on-luma/xebplus-neutrino-loader-plugin/releases/'"
      echo -e "6. 'Extract the UDPBD-for-XEB+ Sync App' folder"
      

      echo -e "${RED}Please type Y for confirm or N for decling (^C to quit.)${RC}"
    fi 
done
