#!/bin/bash
#
# Installs Debian development packages
#

set -e

PACKAGES="devscripts quilt git-buildpackage debhelper debian-keyring \
  debian-archive-keyring"

cd "$(dirname "$0")"

sudo apt-get install $PACKAGES
