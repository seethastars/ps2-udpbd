<!-- Install Instructions -->
## PS2-UDPBD Setup

This is my little guide for setting up my PS2 with a UDPBD server.

1. Install dependencies:

    ```sh
    paru -Syu dotnet-runtime-8.0 exfatprogs
    ```

2. Clone the udpbd-server repo and compile it:

    ```sh
    git clone https://gitlab.com/ps2max/udpbd-server.git
    ```
    ```
    cd udpbd-server/ && make
    ```

3.  Create a new exFAT partition, in my case i have an NVME SSD so it most likely will be: `/dev/nvme0n1p3.`

    > **Note:** Make sure you have a bit of free space with a filesystem on it for creating the partition.

    ```
    sudo mkfs.exfat /dev/nvme0n1p3
    ```

4. Create a new mount point and mount the new partition onto it:

    ```
    sudo mkdir /mnt/ps2
    ```
    ```
    sudo mount /dev/nvme0n1p3 /mnt/ps2 -o uid=$USER
    ```
5. Create folders named `CD` and `DVD` in `/mnt/ps2/` and rip/copy the PS2 disc images into the folder that corresponds with their original source media. 

- Example: `/mnt/ps2/DVD/Grand Thef Auto III.iso`.

6. Download the [latest udpbd release](https://github.com/sync-on-luma/xebplus-neutrino-loader-plugin/releases/) and extract the `UDPBD-for-XEB+ Sync App` folder.

7. For a direct connection (PC to PS2), set a manual IPv4 address and subnet mask:

![ip-settings](.assets/ip-settings.png)

8. Go to the PS2 and open LaunchELF from the browser or open it holding *R1* during FreeMCBoot/PS2BBL startup screen.
Then select **MISC/ --> PS2Net** and let the PS2 idle until an IP address appears on the top screen.

9. Then into `xeb_neutrino/UDPBD Sync App` directory run the following command:

    ```
    dotnet UDPBD-for-XEB+-CLI.dll -path /mnt/ps2/ -ps2ip 192.168.0.10 -bin2iso
    ```

10. Unmount the exFAT partition then go into `udpbd-server` directory and start the udpbd-server.
    
    ```
    sudo umount /mnt/ps2
    ```
    ```
    sudo ./udpbd-server.x86_64 /dev/nvme0n1p3
    ```

The server needs to be open for the entire play session, launch XEB+ and play!

For adding/removing games, stop the udpbd-server and repeat steps: 

- 4: mounting paritition.
- 5: rip/copy games.
- 9
- 10

## Credits

Special thanks to:

[@sync-on-luma](https://github.com/sync-on-luma/xebplus-neutrino-loader-plugin) for making the XEB+ Neutrino Launcher.

[@MegaBitmap](https://github.com/MegaBitmap/UDPBD-for-XEBP) for the UDPBD-XEB server.
