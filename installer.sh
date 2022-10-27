#!/usr/local/bin/bash

echo "Starting the installer!"
cd ..

echo "Installing Updates"
# Installs updates
# Updates security packages
#freebsd-update fetch
#freebsd-update install

# updates package manager
pkg update

echo "Installing Components"
# Installs packages for desktop use
# Installing sudo 
pkg install -y sudo

# Installing VIM
pkg install -y vim

echo "Installing Xorg"
# Installs the Xorg display environment
pkg install -y xorg

echo "Configuring Xorg"
# Configures Xorg
# Removes any previous xorg config files
mv /etc/X11/xorg.conf ~/xorg.conf.etc
mv /usr/local/etc/X11/xorg.conf ~/xorg.conf.localetc

# Adds the remax user to nessacary groups
echo "Adding user Remax to 3d acceleration"
pw groupmod video -m remax || pw groupmod wheel -m remax

echo "Configuring Components"
# Configures the newly installed packages

# Installing dependencies for future packages
pkg install -y libgee
pkg install -y cmake
pkg install -y vala 
pkg install -y gstreamer1-libav 
pkg install -y gtk3 
pkg install -y glib 
pkg install -y libgee 
pkg install -y webkit2-gtk3 
pkg install -y clutter-gtk3 
pkg install -y clutter 
pkg install -y clutter-gst3 
pkg install -y bash

echo "Installing Window Manager"
# Installs the Window Manager
pkg install -y plasma5-kwin




#pkg install -y x11/kde-baseapps
#printf "proc           /proc       procfs  rw  0   0" >> 'etc/fstab/'
#sysrc dbus_enable="YES"

echo "Installing and configuring SDDM"
# Installs and configures the login screen
pkg install -y X11/sddm
sysrc sddm_enable="YES"

echo "Installing Desktop Envioronment"
# Installs the custom desktop environment
# Installing Komorebi for desktop wallpapers
git clone https://github.com/SrWither/KomorebiBSD.git
cd KomorebiBSD
mkdir build && cd build
cmake ..
make
make install

cd ..

# Installs the taskbar for users 
pkg install -y polybar

#Installs ulauncher (app launcher)
pkg install -y ulauncher

# Installing thunar
pkg install -y thunar

# Installing an archiver
pkg install -y xarchiver

# Installing a resource manager
pkg install -y mate-system-monitor

# Installing a text editor
pkg install -y kate

# Installing a terminal emmulator
pkg install -y roxterm

# Installing a media player
pkg install -y parole
pkg install -y mpv

# Installing a audio player
pkg install -y rhythmbox

# Installing a voice recorder
pkg install -y audacity

# Installer image viewer
pkg install -y feh

# Install a IDE
pkg install -y geany

echo "Installing external components"
# Installing external packages for DE
pkg install -y firefox
pkg install -y libreoffice

echo "Configuring external components"
# Configuring the newly installed DE packages
chmod +x autostart.sh 
mv /autostart.sh ~/bin

mv custom_de.desktop ~/usr/share/xsessions/

echo "Installing optional components"
# Installing optional user wanted Components


echo "Finished!"



