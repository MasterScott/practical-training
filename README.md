## Students

1. Open the VM and snapshot if possible.
2. Start the VM and open a terminal window.
3. Execute the following commands to build the environment.

    ```
    cd /opt/practical-training
    sudo git pull
    /opt/practical-training/build.sh
    ```

4. Report any build issues to the instructor.

## Starting from Scratch

1. Create custom Linux/Ubuntu VM.
2. Configure the VM.
    * 1 processor core
    * 2048 GB RAM
    * Disable 3D graphics for the VM (Macbook Pro 16).
    * Remove uneeded peripherals (printer, etc.).
    * Set the disc image for the OS installer.
3. Install Xubuntu.
4. Configure the OS.

    ```
    # Upgrade the OS

    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade

    # Install VM dependencies
    # https://docs.vmware.com/en/VMware-Tools/10.1.0/com.vmware.vsphere.vmwaretools.doc/GUID-8B6EA5B7-453B-48AA-92E5-DB7F061341D1.html

    sudo apt-get install open-vm-tools open-vm-tools-desktop
    ```

5. Shutdown the VM.
6. Adjust the VM configuration.
    * Enable 3D graphics for the VM (Macbook Pro 16).
    * Set the disc image to auto detect.
7. Install the core toolset.

    ```
    # Install Docker
    # https://docs.docker.com/install/linux/docker-ce/ubuntu/

    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo systemctl status docker
    #sudo systemctl enable docker

    # Add user to docker group to run tools

    sudo usermod -aG docker ${USER}

    # Install Docker-Compose
    # https://docs.docker.com/compose/install/

    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Configure the Practical Training repository.

    cd /opt
    sudo git clone https://github.com/lanmaster53/practical-training
    sudo chmod +x /opt/practical-training/*.sh

    sudo reboot
    ```

8. Test for general functionality.

    ```
    id -nG | grep docker
    ```

9. Shutdown and snapshot the VM.

## Pre-Deployment Build

1. Update and run the Pre-build script.

    ```
    cd /opt/practical-training
    sudo git pull
    sudo ./prebuild.sh
    ```

2. Run the cleanup script.

    ```
    cd /opt/practical-training
    sudo ./cleanup.sh
    ```

3. Snapshot the VM.
4. Update the Practical Training repository.
    * Set the `COMMIT` variables in the tool Dockerfiles to `HEAD`.
    * Update the uploaded Burp installers.
5. Complete the steps in the "Students" section above.
6. Run the test script as the `student` user.

    ```
    cd /opt/practical-training
    ./test.sh
    ```

7. Revert to snapshot.
8. Update the `COMMIT` variables in the tool Dockerfiles to the tested commit hashes.
9. Package and distribute the VM.
