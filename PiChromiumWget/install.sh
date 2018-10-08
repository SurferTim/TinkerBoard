#!/bin/bash
#Get root access
sudo mkdir testing
sudo rm -R testing
clear
echo "This will install libraries needed for Netflix, Amazon Prime, and Hulu video playback on the Raspberry Pi"
echo ""
echo "These libraries were tested on"
echo "2018-06-27-raspbian-stretch.img"
echo ""
echo "Press [Enter] to continue"
read var
echo ""
echo "Installing dependencies..."
sudo apt-get install libminizip1
sudo apt-get install libre2-3

wget https://snapshot.debian.org/archive/debian-security/20180701T015633Z/pool/updates/main/c/chromium-browser/chromium_67.0.3396.87-1%7Edeb9u1_armhf.deb
wget https://snapshot.debian.org/archive/debian-security/20180701T015633Z/pool/updates/contrib/c/chromium-browser/chromium-widevine_67.0.3396.87-1%7Edeb9u1_armhf.deb

mv chromium_67.0.3396.87-1~deb9u1_armhf.deb chromium_67.0.3396.87-1_deb9u1_armhf.deb
mv chromium-widevine_67.0.3396.87-1~deb9u1_armhf.deb chromium-widevine_67.0.3396.87-1_deb9u1_armhf.deb 

sudo dpkg -i chromium_67.0.3396.87-1_deb9u1_armhf.deb
sudo rmdir -r /home/linaro/.config/chromium/default
echo "Copying shortcut..."
sudo cp chromium-user.desktop /usr/share/applications
echo "Copying libraries..."
sudo cp lib* /usr/lib/chromium
sudo cp -R pepper /usr/lib/chromium
echo "Installing chromium-widevine..."
sudo dpkg -i chromium-widevine_67.0.3396.87-1_deb9u1_armhf.deb
echo "Locking Chromium versions..."
sudo apt-mark hold chromium
sudo apt-mark hold chromium-widevine
#sudo apt-get install -y -f
sudo 
echo "Done"
echo ""
echo "You can either use the shortcut that was installed in your menu in Internet, or launch with the command line below"
echo "chromium --user-agent=\"Mozilla/5.0 (X11; CrOS armv7l 6946.63.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36\""
echo ""

