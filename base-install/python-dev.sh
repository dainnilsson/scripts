#!/bin/bash
#
# Installs python packages
#

set -e

PACKAGES="virtualenvwrapper python-setuptools python-nose python-m2crypto \
  python-pyscard python-pyside qt4-default python-requests python-webob \
  python-jinja2 python-wtforms python-sqlalchemy python-beaker python-passlib \
  python-serial python-usb"

cd "$(dirname "$0")"

sudo apt-get install $PACKAGES
