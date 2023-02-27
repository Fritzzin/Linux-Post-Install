#!/bin/sh

# Variables
SCRIPTS_FOLDER="$HOME/.scripts"
GREEN=$'\e[0;32m'

# Update repository and system
echo "\n\nUPDATING REPOSITORY AND INSTALLING UPDATES"
sudo apt update && sudo apt upgrade -y

# Install packages
echo "\n\nINSTALLING PACKAGES"
# wget curl
sudo apt install -y wget \
                    curl \
                    openssh-client \
                    build-essential \
                    default-jdk \
                    default-jre \
                    vim \
                    git \
                    nodejs \
                    npm \
                    tlp \
                    tlp-rdw \
                    ufw \
                    timeshift \
                    vlc \
                    unzip \
                    gzip \
                    p7zip-full \
                    p7zip-rar \
                    unrar \
                    unrar-free \
                    neofetch \
                    gimp


echo "\n\nENABLE FIREWALL"
sudo ufw enable
sudo systemctl enable ufw


echo "\n\nENABLE TLP"
sudo tlp start
sudo systemctl enable tlp


# Creating bash_aliases file
echo "\n\nCREATING BASH ALIASES"
touch ~/.bash_aliases
echo "
# BASH
alias bashrc=\"nano ${HOME}/.bashrc\"
alias aliases=\"nano ${HOME}/.bash_aliases\"

# MAINTENANCE
alias update=\"${SCRIPTS_FOLDER}/update.sh\"
alias clean=\"${SCRIPTS_FOLDER}/clean.sh\"
" >> ~/.bash_aliases


# Creating .scripts folder
echo "\n\nCREATING FOLDER AND MOVING SHELL SCRIPTS"
mkdir $SCRIPTS_FOLDER
chmod +x *.sh
mv update.sh $SCRIPTS_FOLDER
mv clean.sh $SCRIPTS_FOLDER
mv monoaudio.sh $SCRIPTS_FOLDER

echo "\n\nDONE \n\n"
