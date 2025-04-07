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
