<!-- Install Instructions -->
## PS2-UDPBD Setup

This is my little guide for setting up my PS2 with a UDPBD server on Arch Linux.

1. Clone the repository:

    ```sh
    git clone https://github.com/seethastars/ps2-udpbd.git
    ```

2. Change to the repository directory:

    ```sh
    cd ps2-udpbd/
    ```
    
3. Run the install script:

    ```sh
    ./setup.sh
    ```
4. Open up paritionmanager and create a new exFAT partition, in my case i have an NVME SSD so it most likely will be: `/dev/nvme0n1p3.`

5. Create a new mount point and mount the new partition in it:

    ```
    sudo mkdir /mnt/ps2/
    sudo mount /dev/nvme0n1p3 /mnt/ps2/ -o uid=$USER
    ```
6. Create folders named `CD` and `DVD` in `/mnt/ps2/`.

7. Rip/copy the PS2 disc images into the folder that corresponds with their original source media. 

- Example: `/mnt/ps2/DVD/Grand Thef Auto III.iso`.

8. Download the [latest udpbd release](https://github.com/MegaBitmap/UDPBD-for-XEBP/releases) and extract the `UDPBD-for-XEB+ Sync App` folder.

9. I use a direct connection between my PC and the PS2, set a manual IPv4 address and subnet mask:
![ip-settings](.assets/ip-settings.png)

10. Go to the PS2 and open LaunchELF from the browser or open it holding *R1* during FreeMCBoot/PS2BBL startup screen.
Then select MISC/ --> PS2Net, let the PS2 idle.

11. Into `xeb_neutrino/UDPBD Sync App` folder run the following command: `dotnet UDPBD-for-XEB+-CLI.dll -path /mnt/ps2 -ps2ip 192.168.0.10 -bin2iso`.

12. Unmount the exFAT partition then into `udpbd-server` folder start the udpbd-server.
```
sudo umount /mnt/ps2
sudo ./udpbd-server /dev/nvme0n1p3
```

The server needs to be open for the entire play session, launch XEB+ and play!

## Credits

Special thanks to:

@sync-on-luma for making the XEB+ Neutrino Launcher.

@MegaBitmap for the UDPBD server.
