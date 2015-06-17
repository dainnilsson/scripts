#!/bin/bash
#
# Installs python packages
#

set -e

PACKAGES="python ipython virtualenvwrapper python-setuptools"

cd "$(dirname "$0")"


sudo apt-get install $PACKAGES
