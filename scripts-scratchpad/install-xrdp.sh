#!bin/bash

# Script to install xrdp server on arch based linux refer to this page: https://rajasekaranp.medium.com/how-to-setup-xrdp-in-manjaro-linux-e176b22bd347

# install xrdp and xorgxrdp-git
sudo pacman -S xrdp xorgxrdp-git

# configure services
sudo systemctl enable xrdp.service
sudo systemctl enable xrdp-sesman.service

sudo echo “allowed_users=anybody” >> /etc/X11/Xwrapper.config

# Comment the line in ~/.xinitrc

#exec $(get_session "$1")

# Add below line to last, save and exit
exec dbus-launch --sh-syntax startplasma-x11

# reboot
sudo reboot now
