#!/bin/bash
#
# Installs and configures basic stuff
#

set -e

cd "$(dirname "$0")"

#Bash
cat bashrc_additions >> ~/.bash_rc

#GPG (run gpg.sh first!)
gpg --recv-key 20EE325B86A81BCBD3E56798F04367096FBA95E8
gpg --card-status

#Git
sudo apt-get install git git2cl
git config --global color.ui "true"
git config --global user.email "dain@yubico.com"
git config --global user.name "Dain Nilsson"
git config --global user.signingkey "0x6FBA95E8"
git config --global push.default simple

#VIM
sudo apt-get install vim
git clone git@github.com:dainnilsson/vimconf.git ~/.vim
~/.vim/install.sh

#Pass
sudo apt-get install pass python-qrcode
git clone dain.se:/git/password-store.git ~/.password-store

echo "ALL DONE!"
