#!/bin/bash

# Necessary Packages

sudo pacman -S btop --noconfirm
sudo pacman -S curl --noconfirm
sudo pacman -S wget --noconfirm
sudo pacman -S fzf --noconfirm
sudo pacman -S neofetch --noconfirm
sudo pacman -S fastfetch --noconfirm
sudo pacman -S ffmpeg --noconfirm
sudo pacman -S kitty --noconfirm
sudo pacman -S nodejs --noconfirm
sudo pacman -S npm --noconfirm
sudo pacman -S nvtop --noconfirm
sudo pacman -S unzip --noconfirm
sudo pacman -S yazi --noconfirm
sudo pacman -S eza --noconfirm

# Package Managers
sudo pacman -S yay --noconfirm
sudo pacman -S flatpak --noconfirm

# Applications

    # install zen via flatpak
    flatpak install flathub app.zen_browser.zen --noconfirm

    # install discord
    flatpak install flathub com.discordapp.Discord --noconfirm

    # install telegram
    flatpak install flathub org.telegram.desktop --noconfirm

    # install spotify
    flatpak install flathub com.spotify.Client --noconfirm

    # install vivaldi
    flatpak install flathub com.vivaldi.Vivaldi --noconfirm

# Developer Tools
sudo pacman -S git --noconfirm
sudo pacman -S nodejs --noconfirm
sudo pacman -S npm --noconfirm
sudo pacman -S neovim --noconfirm
