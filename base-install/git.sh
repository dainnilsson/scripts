#!/bin/bash
#
# Installs and configures git
#

set -e

# Make sure we have git
if [ ! -x /usr/bin/git ] ; then
	sudo apt-get install git
fi

git config --global color.ui "true"
git config --global user.email "dain@yubico.com"
git config --global user.name "Dain Nilsson"
git config --global user.signingkey "0x6FBA95E8"
git config --global push.default simple
git config --global commit.gpgsign true
git config --global gpg.program "gpg2"
git config --global --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"

