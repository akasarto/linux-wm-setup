#!/usr/bin/env bash

# exit on errors
set -e
set -u

# track work dir

wdir=$(pwd)

# recreate folders
cd ~
rm -rf .tools
rm -rf .fonts
mkdir .tools
mkdir .fonts

# update packages
sudo apt update
sudo apt upgrade -y

# install dependencies
sudo apt install -y \
    curl \
    wget \
    xserver-xorg-core \
    x11-xserver-utils \
    mesa-utils \
    xinit \
    i3-wm \
    rxvt-unicode \
    thunar \
    rofi

# .Xresources

cd $wdir
cp .Xresources ~

# 7zip
cd ~/.tools/

sudo rm -f /usr/bin/7z

wget https://www.7-zip.org/a/7z2409-linux-x64.tar.xz

tar -xf 7z2409-linux-x64.tar.xz 7zz
sudo ln -s ~/.tools/7zz /usr/bin/7z
rm -f 7z2409-linux-x64.tar.xz

# Cascadia Code Font
cd ~/.fonts/

wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip

7z e CascadiaCode-2407.24.zip ttf/*.ttf
rm -f CascadiaCode-2407.24.zip

# Brave
cd ~

curl -fsS https://dl.brave.com/install.sh | sh