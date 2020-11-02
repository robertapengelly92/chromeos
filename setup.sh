#!/bin/sh

sudo su

echo "unset HISTFILE" >> /etc/bash.bashrc

echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
echo "QT_STYLE_OVERRIDE=gtk2" >> /etc/environment

#apt -y install software-properties-common
apt -y install binutils bison flex gcc gcc-multilib g++ make nasm || exit 1

apt -y install git imagemagick libncursesw5 qt5-style-plugins p7zip-full pkg-config sqlite3 subversion texinfo webp xorriso || exit 1
apt -y install qemu qemu-block-extra qemu-kvm qemu-slof qemu-system qemu-user qemu-utils || exit 1
apt -y install bochs bochsbios bochs-x vgabios || exit 1
apt -y install deluge gdebi-core ghex gimp isomaster python3 python3-pip || exit 1

apt -y install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt -y install brave-browser

apt -y purge --autoremove
exit

mkdir -p ~/.config ~/.fonts ~/.vmware
mkdir -p ~/.config/Code/User ~/.config/Notepadqq

wget -O ~/.config/Code/User/keybindings.json https://raw.githubusercontent.com/robertapengelly92/visual-studio-code/master/keybindings.json
wget -O ~/.config/Code/User/settings.json https://raw.githubusercontent.com/robertapengelly92/visual-studio-code/master/settings.json
wget -O ~/.config/Notepadqq/Notepadqq.ini https://raw.githubusercontent.com/robertapengelly92/ubuntu/master/Notepadqq.ini
wget -O ~/.vmware/preferences https://raw.githubusercontent.com/robertapengelly92/ubuntu/master/preferences

echo "[QT]" >> ~/.config/Trolltech.conf
echo "style=GTK+" >> ~/.config/Trolltech.conf
