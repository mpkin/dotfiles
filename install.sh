#! /bin/bash

# install.sh: automatically installs necessary software

# get distro name (stored in $ID)
. /etc/os-release

read -r -p "Update the entire system? (Y/n): " ANS_UPDATE
case ${ANS_UPDATE} in
  Y) case ${ID} in
       ubuntu) sudo apt -y update
               sudo apt -y upgrade ;;
       *) ;;
     esac ;;
  *) ;;
esac

case ${ID} in
   ubuntu)  
     while read -r package; do
         sudo apt install -y "$package"
     done < pkgs_ubuntu.txt
     ;;
   *) 
     ;;
esac

# install starship
wget -P /tmp https://starship.rs/install.sh && mkdir -p ${HOME}/opt/starship && sh /tmp/install.sh -y -b ${HOME}/opt/starship
