#/bin/sh

# first uninstall devel packages from previous version
cd /system/packages
pkgman uninstall *_devel-6.6.0 -y

# set path to haikuports/packages
source ~/config/settings/haikuports.conf
cd "$TREE_PATH"/packages/

# the recipes should be installed in this order
pkgman install *6.6.2* -y
