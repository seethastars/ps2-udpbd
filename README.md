<!-- Install Instructions -->
## PS2-UDPBD Setup

This is my little setup script for setting up my PS2 with a UDPBD server for playing games.

1. Clone the repository:

    ```sh
    git clone https://github.com/seethastars/ps2-updbd.git
    ```

2. Change to the repository directory:

    ```sh
    cd ps2-upbdb/
    ```
    
3. Run the install script:

    ```sh
    ./setup.sh
    ```
4. Open up paritionmanager and create a new exfat partition, in my case i have an NVME SSD so it most likely will be `/dev/nvme0n1p3.`

5. Create a new mount point and mount the new partition in it:

    ```
    sudo mkdir /mnt/ps2/
    sudo mount /dev/nvme0n1p3 /mnt/ps2/ -o uid=$USER
    ```
6. Create folders named `CD` and `DVD` in /mnt/ps2/."

7. Rip/copy the PS2 disc images into the folder that corresponds with their original source media. 

Example: `/mnt/ps2/Grand Thef Auto III.iso`.

8. Download the ![https://github.com/MegaBitmap/UDPBD-for-XEBP/releases]latest upbdb release and extract the `UDPBD-for-XEB+ Sync App`.
