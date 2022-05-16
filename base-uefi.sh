#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwclock --hctosys
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts
echo root:password | chpasswd

pacman -S efibootmgr networkmanager network-manager-applet wpa_supplicant mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils alsa-utils pulseaudio pavucontrol ntfs-3g

systemctl enable NetworkManager

useradd -m arteis
echo arteis:password | chpasswd

echo "arteis ALL=(ALL) ALL" >> /etc/sudoers.d/ermanno


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"



