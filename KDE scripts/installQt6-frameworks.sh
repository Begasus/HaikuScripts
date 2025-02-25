#/bin/sh

# first uninstall devel packages from previous version
cd /system/packages
pkgman uninstall *_devel-6.11.0 -y

# set path to haikuports/packages
source ~/config/settings/haikuports.conf
#cd "$TREE_PATH"/packages/

cd /Opslag/backup/Qt6/6.10.2

# the recipes should be installed in this order

pkgman install  qt6_base* -y			#patches
#pkgman install  qt6_haikuplugins* -y	#patches
pkgman install  qt6_shadertools* -y
pkgman install  qt6_languageserver* -y
pkgman install  qt6_svg* -y
pkgman install  qt6_declarative* -y		#patches
pkgman install  qt6_connectivity* -y
pkgman install  qt6_5compat* -y
pkgman install  qt6_multimedia* -y		#patches
pkgman install  qt6_charts* -y
pkgman install  qt6_quicktimeline* -y
# 10 Part2
pkgman install  qt6_datavis3d* -y		#patches
pkgman install  qt6_imageformats* -y
pkgman install  qt6_lottie* -y
pkgman install  qt6_networkauth* -y
pkgman install  qt6_serialport* -y		#patches
pkgman install  qt6_positioning* -y
pkgman install  qt6_location* -y
pkgman install  qt6_quick3d* -y
pkgman install  qt6_quick3dphysics* -y	#patches
pkgman install  qt6_scxml* -y
# 20 Part3
pkgman install  qt6_sensors* -y			#patches
pkgman install  qt6_websockets* -y
pkgman install  qt6_webchannel* -y
pkgman install  qt6_webview* -y
pkgman install  qt6_tools* -y
pkgman install  qt6_translations* -y
pkgman install  qt6_speech* -y		#patches
pkgman install  qt6_3d* -y
# Warning: POLICY ERROR: no matching provides "lib:libqt63dquicklogic" for "lib/libQt63DQuickLogic.so"

pkgman install  qt6_doc* -y
pkgman install  qt6_examples* -y
# 30 Part4

pkgman install qt6_qtmqtt* -y
pkgman install qt6_graphs* -y
pkgman install qt6_httpserver* -y
pkgman install qt6_remoteobjects* -y
pkgman install qt6_serialbus* -y
