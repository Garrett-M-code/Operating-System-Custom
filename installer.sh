#!/bin/bash

echo Starting the installer!

echo Installing Updates
# Installs updates
# Updates security packages
freebsd-update fetch
freebsd-update install

# updates package manager
pkg update

echo Installing Components
# Installs packages for desktop use
# Installing sudo 
pkg install sudo

# Installing VIM
pkg install vim

# Installing dependencies for future packages
pkg install libgee

echo Configuring Components
# Configures the newly installed packages


echo Installing Xorg
# Installs the Xorg display environment
pkg install xorg

echo Configuring Xorg
# Configures Xorg
# Removes any previous xorg config files
mv /etc/X11/xorg.conf ~/xorg.conf.etc
mv /usr/local/etc/X11/xorg.conf ~/xorg.conf.localetc

# Adds the remax user to nessacary groups
echo Adding user "Remax" to 3d acceleration
pw groupmod video -m remax || pw groupmod wheel -m remax

echo Installing Window Manager
# Installs the Window Manager
pkg install x11/kde-baseapps
printf "proc           /proc       procfs  rw  0   0" >> 'etc/fstab/'
sysrc dbus_enable="YES"

echo Installing and configuring SDDM
# Installs and configures the login screen
pkg install X11/sddm
sysrc sddm_enable="YES"

echo Installing Desktop Envioronment
# Installs the custom desktop environment
# Installing Komorebi for desktop wallpapers
git clone https://github.com/SrWither/KomorebiBSD.git
cd KomorebiBSD
mkdir build && cd build
cmake ..
make
make install

# Installs the taskbar for users 
pkg install polybar

#Installs ulauncher (app launcher)
pkg install ulauncher

echo Installing external components
# Installing external packages for DE
pkg install firefox

echo Configuring external components
# Configuring the newly installed DE packages
pkg install libreoffice

echo Installing optional components
# Installing optional user wanted Components


echo Finished!



