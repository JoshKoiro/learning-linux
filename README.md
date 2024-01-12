# learning-linux
just a repo of notes and scripts as I'm learning more about Linux and managing Linux systems

## Installing Vanilla Debian

### Installing CLI version

Make sure to unselect "Debian desktop environment" as well as the default GNOME option and only select "SSH server" and "standard system utilities"

![Gui Selection](images/guiSelection.png)

### Installing the GUI

Make sure to select the top "Debian desktop environment" from the top of the list as well as which desktop environment version to install (GNOME is default)

## Using VMWare - Networking
When you right click on teh virtual machine (or are setting it up for the first time) you must select the network adapter and choose VMnet0 from the "Custom" option for network connections. VMnet0 is a bridged network so it will show up on your network that the host computer is connected to.
![VM Network Settings](images/vmNetworkSettings.png)

## Establishing SSH connection

Run this command to install open ssh:

`sudo apt install openssh-server`

Check the service is running by running this command:

`sudo systemctl status ssh`

## Setting power settings and persistance
In my case I'm setting this up on a laptop as a server system so we need to set the power settings so that it never goes into hibernate and set the system configuration so that it stays on when the lid is closed.

First, let's set the power settings:

### Disabling Suspend and Hibernation

`sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`

after rebooting, you can check to make sure the status has changed by running the following command:

`sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target`

Each item shown should show as inactive

### Disabling Suspend when the lid closes

Next, we will modify the system file so that the system stays on when the lid is closed.
`cd /etc/systemd'

Open the configuration file in vi (vim)
`vi logind.conf`

We are going to change the variable `HandleLidSwitch`, `HandleLidSwitchExternalPower`, and optionally `HandleLidSwitchDocked` from `suspend` to `ignore` and removing the `#` (comment) before each line.

Then save the file.

After making these changes, make sure to reboot.

reboot using the following command:

`sudo reboot`

## Connecting to the GUI over LAN

`sudo apt install xrdp`

`sudo systemctl enable xrdp`

`sudo ifw allow from any to any port 3389`

## Install neovim (nvim)

Neovim is a version of vim that is better suited to extendability using plugins written in the Lua language. vi comes pre-installed with debian but if you plan to do any kind of programming or lots of text editing via the terminal, it might be helpful to have available.

`sudo apt-get install neovim`

## Installing git

Git comes preinstalled with Debian linux, so not need to run any install script.

## Setting up dot file backups
This system is using the git --bare method for 


