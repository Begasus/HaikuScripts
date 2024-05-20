#/bin/sh

# first uninstall devel packages from previous version
cd /system/packages
pkgman uninstall *_devel-6.7.0 -y

# set path to haikuports/packages
source ~/config/settings/haikuports.conf
cd "$TREE_PATH"/packages/

# the recipes should be installed in this order
pkgman install *6-6.7.0* -y
pkgman install *_devel-6.7.0* -y

# kde-plasma (done already)
#pkgman install ./breeze6*6.2.0*  -y
#pkgman install ./kdecoration6*6.2.0*  -y
#pkgman install ./kde_cli_tools6*6.2.0*  -y
#pkgman install ./plasma_activities6*6.2.0*  -y
#pkgman install ./plasma_activities_stats6*6.2.0*  -y
