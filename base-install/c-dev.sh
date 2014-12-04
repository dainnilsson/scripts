#!/bin/bash
#
# Installs Debian development packages
#

set -e

PACKAGES="cmake autoconf libtool libpcsclite-dev"

cd "$(dirname "$0")"

sudo apt-get install $PACKAGES
