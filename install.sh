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
                    luarocks \
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

# DOTFILES
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
" >> ~/.bash_aliases

# Creating .scripts folder
echo "\n\nCREATING SCRIPTS FOLDER AND MOVING SCRIPTS"
mkdir $SCRIPTS_FOLDER
chmod +x *.sh
mv update.sh $SCRIPTS_FOLDER
mv clean.sh $SCRIPTS_FOLDER
mv monoaudio.sh $SCRIPTS_FOLDER

# Settings up dotfiles from github repo
echo "\n\nSETUP DOTFILES"
git clone https://github.com/fritzzin/dotfiles
cd dotfiles
mv .config/nvim ~/.config/

# Lua rocks
sudo luarocks install luafilesystem

# Installing Packer plugin manager for nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Installing nvim from github
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo dpkg --install nvim-linux64.deb
sudo apt install -f

echo "\n\nDONE \n\n"
