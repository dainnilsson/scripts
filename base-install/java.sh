#!/bin/bash
#
# Installs Java packages
#

set -e

PACKAGES="default-jdk maven"

cd "$(dirname "$0")"


sudo apt-get install $PACKAGES
