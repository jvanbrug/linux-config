# Virtual Machine Setup 

If you are not running a UNIX system like Mac OS or Linux natively, it is useful to configure a virtual machine for development purposes. This allows for a consistent environment between development and deployment, making configuring and testing simpler and more reliable.

This guide will explain how to configure a virtual machine (with Linux Mint 17.3 as an example) using VirtualBox.

## Create Virtual Machine

For more information on VirtualBox, see the [documentation](https://www.virtualbox.org/manual/UserManual.html).

* Download VirtualBox for your current operating system (your "host machine") from [here](https://www.virtualbox.org/wiki/Downloads). 
* Run the installer and launch VirtualBox
* Click `New` to create a new virtual machine

(The following instructions contain some steps that are specific to Linux Mint. If you would like to use another Linux distribution, you can, but other guides may not contain applicable instructions.)
* fill in the fields in the "Name and operating system" dialog:
  * Name: Linux Mint
  * Type: Linux
  * Version: Other Linux (32 or 64 bit depending on your current machine)
  * Click `Next`
* Set the memory size appropriately. I recommend using about 1/4 of your total available RAM.
  * ex. allocate 4GB (4096MB) for a computer with 16GB of RAM
  * Click `Next`

(You can deviate here if you know what you are doing)
* On the "Hard disk" dialog, choose: Create a virtual hard disk now. Click `Create`.
* Choose "VDI". Click `Next`.
* Create a "Fixed size" hard disk, which will allocate a fixed amount of storage to the virtual hard drive. This will take slightly longer to create, but will allow for a more responsive environment. Select "Fixed size", click `Next`
* In the "File location and size" dialog:
  * leave the name and location as default. This will create a folder inside the `VirtualBox VMs` directory with a name matching the virtual machine's name specified at the beginning
  * set the size to at least 20GB (we need room for the Operating System, as well as some programs and files). I set mine to 50GB to be safe. It absolutely must be bigger than 10GB, or Linux Mint will not install. 


## Boot Linux Mint

* Download [Linux Mint](http://www.linuxmint.com/download.php). There are a few different desktop options. If you don't know which one to pick, choose Cinnamon for either 32 or 64 bit, depending on your host machine.
* In VirtualBox, click on the newly created virtual machine, and select `Start`, or double-click on the machine.
* In the start-up disk dialog, navigate to the `.iso` file you just downloaded for Linux Mint, and click `Start`
* Once the Desktop boots up, double-click on the CD icon that says "Install Linux Mint"
* Choose your language
* You will now see a health check for the installation. As long as you have enough available memory, your computer is plugged in, and you have an internet connection, you will be all set. Click `Next`.
* On the "Installation type" dialog, choose "Something else". Don't choose another option unless you know what you are doing. Click `Install Now`.

### Create Partitions

* Click `New Partition Table...`
* It will warn you that you are partitioning an entire device. We are just partitioning the virtual hard disk, so this is fine. Click `Continue`.
* A "free space" partition should show up in the window. Click on it, and now the "+" button should be clickable at the button of the window. Click "+".
* First we will create the swap memory, which is memory that is allocated for use with the RAM is full. Use these parameters;
  * Size: 1.5 x RAM (ie. for 4GB RAM, set this to 6000MB (~6GB))
  * Type: Logical
  * Location: Beginning of this space
  * Use as: swap area
* Click `OK`
* You'll see the new partition show up in the window

* Click on the "free space" partition, click "+" to add another partition.
* Next we will create the "root" partition, where the OS will be mounted and programs will be installed. If you are just using this for development, you shouldn't need much room for programs. Use these parameters:
  * Size: 12000MB (~12GB). 
  * Type: Primary
  * Location: Beginning of this space
  * Use as: Ext4 journaling file system
  * Mount point: /
* Click `OK`
* You'll see the new partition show up in the window

* Click on the "free space" partition, click "+" to add another partition.
* Lastly, we will create the home partition with the remaining free space, which will contain all personal files. Use these parameters:
  * Size: Leave this as is, it should be equal to the amount of free space remaining
  * Type: Logical
  * Location: Beginning of this space
  * Use as: Ext4 journaling file system
  * Mount point: /home
* Click `OK`
* You'll see the new partition show up in the window

* Make sure the "Device for boot loader installation" is set to `/dev/sda ATA VBOX HARDDISK (xx.x GB)`
* Click `Install Now`
* In the confirmation dialog, click `Continue`
* Choose your location, click `Continue`
* Choose your keyboard layout, click `Continue`* Choose your location, click `Continue`
* Fill out the "Who are you?" page however you'd like. Click `Continue` when done. 
* The installation will begin. Wait until it is complete. Click `Restart Now` when prompted. 
* (You may need to press ENTER when prompted for the machine to boot back up)
* Once the boot is complete, you should see the welcome screen and now the virtual machine is up and running on Linux Mint!

* The `.iso` file that you originally booted from can be deleted now that the Operating System has been installed onto the virtual hard drive.


## Additional Configuration

If you would like to configure the virtual machine in more detail, see the official [configuration documentation](https://www.virtualbox.org/manual/ch03.html). 


## Next Steps

See `LINUX_CONFIGURATION.md` to configure your Linux system for development.
