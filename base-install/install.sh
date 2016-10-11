#!/bin/bash
#
# Installs and configures basic stuff
#

set -e

cd "$(dirname "$0")"

#Bash
cat bashrc_additions >> ~/.bashrc

#GPG (run gpg.sh first!)
gpg2 --recv-key 20EE325B86A81BCBD3E56798F04367096FBA95E8
gpg2 --card-status

#Git
./git.sh

#VIM
git clone git@github.com:dainnilsson/vimconf.git ~/.vim
~/.vim/install.sh

#Pass
sudo apt-get install pass python-qrcode
git clone dain.se:/git/password-store.git ~/.password-store

echo "ALL DONE!"
