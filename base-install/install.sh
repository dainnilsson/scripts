#!/bin/bash
#
# Installs and configures basic stuff
#

set -e

cd "$(dirname "$0")"

#Bash
cat bashrc_additions >> ~/.bash_rc

#GPG
./gpg-agent-installation.sh

#Git
sudo apt-get install git
git config --global color.ui "true"
git config --global user.email "dain@yubico.com"
git config --global user.name "Dain Nilsson"
git config --global user.signingkey "0x6FBA95E8"
git config --global push.default simple

#VIM
sudo apt-get install vim
git clone git@github.com:dainnilsson/vimconf.git ~/.vim
~/.vim/install.sh

echo "ALL DONE!"
