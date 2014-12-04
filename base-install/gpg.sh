#!/bin/bash
#
# Installs packages needed for smartcard use under Ubuntu.
#

set -e

#Install needed stuff:
sudo apt-get install gnupg2 pcscd opensc gpgsm gnupg-agent

#Create .gnupg dir
gpg --list-keys

#Use SHA2 instead of SHA1
echo "personal-digest-preferences SHA256" >> ~/.gnupg/gpg.conf
echo "cert-digest-algo SHA256" >> ~/.gnupg/gpg.conf
echo "default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed" >> ~/.gnupg/gpg.conf

#Disable gnome crap:
echo "X-GNOME-Autostart-enabled=false" | sudo tee -a /etc/xdg/autostart/gnome-keyring-gpg.desktop
echo "X-GNOME-Autostart-enabled=false" | sudo tee -a /etc/xdg/autostart/gnome-keyring-ssh.desktop

#Configure gpg-agent:
echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
echo "write-env-file $HOME/.gnupg/gpg-agent-info" >> ~/.gnupg/gpg-agent.conf

#Restart agent
killall -9 gpg-agent || true
gpg-agent --daemon

#Add to ~/.bashrc (or other place that gets run automatically).
echo "source ~/.gnupg/gpg-agent-info" >> ~/.bashrc

cat << EOF
You will need to autostart gpg-agent --daemon on startup. In XFCE, this is easiest done
by adding an Application Autostart in the Session and Startup section of Settings.

Now reboot your computer.

NOTE: If you're running VMWare and need to attach a NEO in composite mode, you will
need to make changes to the .vmx file to allow you to attach HID devices:

  usb.generic.allowHID = "TRUE"
  usb.generic.allowLastHID = "TRUE"
EOF
