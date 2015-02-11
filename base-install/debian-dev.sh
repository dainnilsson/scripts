#!/bin/bash
#
# Installs Debian development packages
#

set -e

PACKAGES="quilt git-buildpackage debhelper debian-keyring \
  debian-archive-keyring"

cd "$(dirname "$0")"

echo "Installing packages..."
sudo apt-get install $PACKAGES

echo "Setting up pbuilder hooks..."
# Setup pbuilder hooks
HOOKDIR="$HOME/pbuilder-hooks"
mkdir -p $HOOKDIR
echo "HOOKDIR=$HOOKDIR" > ~/.pbuilderrc

# Run lintian as part of build
LINTIAN_HOOK="$HOOKDIR/B90lintian"
cat << EOF > $LINTIAN_HOOK
#!/bin/sh
apt-get -y --force-yes install lintian
echo +++ lintian output +++
su -c "lintian -E -v -i -I --pedantic --show-overrides /tmp/buildd/*.changes; :" - pbuilder
echo +++ end of lintian output +++
EOF

chmod +x $LINTIAN_HOOK
