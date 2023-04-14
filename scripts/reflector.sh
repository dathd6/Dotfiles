#!/usr/bin/bash

pacman -S --needed --noconfirm reflector

echo                     '--sort rate' >  /etc/xdg/reflector/reflector.conf
echo '--save /etc/pacman.d/mirrorlist' >> /etc/xdg/reflector/reflector.conf
echo                '--protocol https' >> /etc/xdg/reflector/reflector.conf
echo                      '--latest 5' >> /etc/xdg/reflector/reflector.conf
echo         '--connection-timeout 15' >> /etc/xdg/reflector/reflector.conf
echo           '--download-timeout 15' >> /etc/xdg/reflector/reflector.conf

systemctl enable reflector.service --now
