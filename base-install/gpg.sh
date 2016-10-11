#!/bin/bash
#
# Installs packages needed for smartcard use under Ubuntu.
#

set -e

#Install needed stuff:
sudo apt-get install gnupg2 pcscd scdaemon

#Create .gnupg dir
gpg2 --list-keys

#Use SHA2 instead of SHA1
echo "personal-digest-preferences SHA256" >> ~/.gnupg/gpg.conf
echo "cert-digest-algo SHA256" >> ~/.gnupg/gpg.conf
echo "default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed" >> ~/.gnupg/gpg.conf

#Set a default keyserver
echo "keyserver hkp://keys.gnupg.net" >> ~/.gnupg/gpg.conf

#Configure gpg-agent:
echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf

#Restart agent
gpg-connect-agent killagent /bye
gpg-connect-agent /bye

#Add to ~/.bashrc (or other place that gets run automatically).
echo "export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh" >> ~/.bashrc

#Use gpg2 instead of gpg.
echo "alias gpg=gpg2" >> ~/.bash_aliases

cat << EOF
NOTE: If you're running VMWare and need to attach a YubiKey in composite mode,
you will need to make changes to the .vmx file to allow you to attach HID
devices:

  usb.generic.allowHID = "TRUE"
  usb.generic.allowLastHID = "TRUE"

You may also want to disable "Smart Card Sharing" since it doesn't seem to work.

  usb.ccid.useSharedMode = "FALSE"
EOF
