#!/usr/bin/env bash

# exit on errors
set -e
set -u

# reset
cd ~

# recreate folders
rm -rf .tools
rm -rf .fonts
mkdir .tools
mkdir .fonts

# update packages
sudo apt update
sudo apt upgrade -y

# install dependencies
sudo apt install \
    xserver-xorg-core \
    x11-xserver-utils \
    xinit \
    wget \
    i3-wm \
    rxvt-unicode \
    exa

# download and install 7zip
cd .tools/

rm -f /usr/bin/7z

wget https://www.7-zip.org/a/7z2409-linux-x64.tar.xz

tar -xf 7z2409-linux-x64.tar.xz 7zz
sudo ln -s ~/.tools/7zz /usr/bin/7z
rm -f 7z2409-linux-x64.tar.xz
cd ~

# download and install fonts
cd .fonts/

wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip

7z e CascadiaCode-2407.24.zip ttf/*.ttf
rm -f CascadiaCode-2407.24.zip
cd ~

# copy .Xresource file for console theme

cp ./Xresources ~/

# download and install Microsoft Edge :p

wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_131.0.2903.99-1_amd64.deb

sudo apt install ~/microsoft-edge-stable_131.0.2903.99-1_amd64.deb