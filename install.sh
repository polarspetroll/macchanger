#!/usr/bin/env bash
if [ `whoami` != 'root' ]
  then
    echo -e "\e[91mYou must run this program with root privilege"
    exit
fi
echo -ne '\e[96m#####                     (50%)\r'
sleep 1
chmod +x mchanger.rb
echo -ne '\e[96m#############             (66%)\r'
sleep 1
cp mchanger.rb /usr/local/bin
echo -ne '\e[96m#######################   (100%)\r'
echo -ne '\n'
