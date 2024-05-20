#/bin/sh

# Frameworks moved to Plasma
# kactivities
# kactivities-stats
# kwayland
# plasma-framework

# Frameworks No Longer Shipped
# These are considered obsolete for future development
# kdesignerplugin
# kdewebkit
# kemoticons
# khtml
# kinit
# kjs
# kjsembed
# kmediaplayer
# kross
# kxmlrpcclient
# kdelibs4support
# Oxygen Icons will be shipped standalone due to its large size and infrequent development and renamed to oxygen-icons
# oxygen-icons5

# Coinstallability #KF5
# Only one version of extra-cmake-modules can be installed. The KF6 version is backwards compatible and should also be used for KF5 builds.

# For Frameworks and other relevant libraries we aim for being able to install both a 5 and a 6 version without conflicts.
# However there are cases where this cannot be provided out of the box, e.g. because a Framework contains runtime parts that must only exist once.
# Some projects have build flags to disable such problematic parts that should be applied to the KF5 build:

# kguiaddons: -DBUILD_GEO_SCHEME_HANDLER=OFF
# baloo: -DBUILD_INDEXER_SERVICE=OFF
# kglobalaccel: -DKF6_COMPAT_BUILD=ON
# kwallet: -DBUILD_KWALLETD=OFF and -DBUILD_KWALLET_QUERY=OFF
# kio: -DKF6_COMPAT_BUILD=ON
# broken?
# plasma-framework: -DBUILD_DESKTOPTHEMES=OFF (now releases with Plasma)

#/bin/sh
source ~/config/settings/haikuports.conf
# net-irc
cd "$TREE_PATH"/kde-frameworks/

old_version="6.6.0"
new_version="6.7.0"

# bump recipe filenames
find . -maxdepth 2 -type f -name "*$old_version*.recipe" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# bump patchset filenames
find . -maxdepth 3 -type f -name "*$old_version*.patchset" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# reset revision
sed -i "/^REVISION=/s/=.*/=\"1\"/" */*.recipe

# print SOURCE_URI recipe file name
find . -maxdepth 2 -name "*$new_version*.recipe" | while read FNAME; do \
portVersion=$new_version ; source $FNAME ; echo $SOURCE_URI $FNAME ;

# replace CHECKSUM_SHA256 with new once
sed -i "s/$CHECKSUM_SHA256/`curl -sL $SOURCE_URI | sha256sum | head -c 64`/" $FNAME ; done

# the recipes should be built in this order

# folowing kdesrc-build policy: kdesrc-build frameworks

# 1
haikuporter -SG -j8 --no-source-packages --get-dependencies extra_cmake_modules
haikuporter -SG -j8 --no-source-packages --get-dependencies phonon6
haikuporter -SG -j8 --no-source-packages --get-dependencies ki18n6
haikuporter -SG -j8 --no-source-packages --get-dependencies kconfig6
haikuporter -SG -j8 --no-source-packages --get-dependencies kcoreaddons6
# wayland
# plasma-wayland-protocols
haikuporter -SG -j8 --no-source-packages --get-dependencies kcodecs6
haikuporter -SG -j8 --no-source-packages --get-dependencies karchive6
haikuporter -SG -j8 --no-source-packages --get-dependencies kwidgetsaddons6
haikuporter -SG -j8 --no-source-packages --get-dependencies kguiaddons6 #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies kcolorscheme6 # new
# 10
haikuporter -SG -j8 --no-source-packages --get-dependencies kconfigwidgets6
# wayland-protocols
haikuporter -G -j8 --no-source-packages --get-dependencies breeze_icons
haikuporter -SG -j8 --no-source-packages --get-dependencies kdoctools6
haikuporter -SG -j8 --no-source-packages --get-dependencies kiconthemes6
haikuporter -SG -j8 --no-source-packages --get-dependencies kwindowsystem6
# libgpg-error (for gpgmeqt6)
haikuporter -SG -j8 --no-source-packages --get-dependencies kcompletion6
haikuporter -SG -j8 --no-source-packages --get-dependencies kdbusaddons6
haikuporter -SG -j8 --no-source-packages --get-dependencies kitemviews6
haikuporter -SG -j8 --no-source-packages --get-dependencies knotifications6
# gpgme (for qt6)
# polkit-qt-1
# qca (qt6)
haikuporter -SG -j8 --no-source-packages --get-dependencies kcrash6
# 20
haikuporter -SG -j8 --no-source-packages --get-dependencies kservice6
haikuporter -SG -j8 --no-source-packages --get-dependencies kauth6
haikuporter -SG -j8 --no-source-packages --get-dependencies kbookmarks6
haikuporter -SG -j8 --no-source-packages --get-dependencies kjobwidgets6
haikuporter -SG -j8 --no-source-packages --get-dependencies kwallet6 #KF5 # qca
haikuporter -SG -j8 --no-source-packages --get-dependencies solid6
haikuporter -SG -j8 --no-source-packages --get-dependencies kio6 #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies sonnet6
haikuporter -SG -j8 --no-source-packages --get-dependencies kglobalaccel6 #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies kirigami6
# 30
haikuporter -SG -j8 --no-source-packages --get-dependencies ktextwidgets6
haikuporter -SG -j8 --no-source-packages --get-dependencies kxmlgui6
# poppler_qt6
haikuporter -SG -j8 --no-source-packages --get-dependencies attica6
haikuporter -SG -j8 --no-source-packages --get-dependencies kpackage6
haikuporter -SG -j8 --no-source-packages --get-dependencies syndication6
haikuporter -SG -j8 --no-source-packages --get-dependencies kcontacts6
# libQMobipocket6
haikuporter -SG -j8 --no-source-packages --get-dependencies kfilemetadata6
haikuporter -SG -j8 --no-source-packages --get-dependencies kidletime6
haikuporter -SG -j8 --no-source-packages --get-dependencies kitemmodels6
haikuporter -SG -j8 --no-source-packages --get-dependencies knewstuff6
# 40
haikuporter -SG -j8 --no-source-packages --get-dependencies kparts6
haikuporter -SG -j8 --no-source-packages --get-dependencies kpty6
# oxygen-icons
haikuporter -SG -j8 --no-source-packages --get-dependencies ksyntax_highlighting6
haikuporter -SG -j8 --no-source-packages --get-dependencies threadweaver6
haikuporter -SG -j8 --no-source-packages --get-dependencies baloo6 #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies bluez_qt6
haikuporter -SG -j8 --no-source-packages --get-dependencies frameworkintegration6
haikuporter -SG -j8 --no-source-packages --get-dependencies kapidox6
haikuporter -SG -j8 --no-source-packages --get-dependencies kcalendarcore6
haikuporter -SG -j8 --no-source-packages --get-dependencies kcmutils6
haikuporter -SG -j8 --no-source-packages --get-dependencies kdav6
# 50
haikuporter -SG -j8 --no-source-packages --get-dependencies kdeclarative6
haikuporter -SG -j8 --no-source-packages --get-dependencies kded6
haikuporter -SG -j8 --no-source-packages --get-dependencies kdesu6
haikuporter -SG -j8 --no-source-packages --get-dependencies kdnssd6
haikuporter -SG -j8 --no-source-packages --get-dependencies kholidays6
haikuporter -SG -j8 --no-source-packages --get-dependencies kimageformats6 # needs newer libjxl (devel:libheif$secondaryArchSuffix?)
haikuporter -SG -j8 --no-source-packages --get-dependencies knotifyconfig6
haikuporter -SG -j8 --no-source-packages --get-dependencies kpeople6
haikuporter -SG -j8 --no-source-packages --get-dependencies kplotting6
haikuporter -SG -j8 --no-source-packages --get-dependencies kquickcharts6
# 60
haikuporter -SG -j8 --no-source-packages --get-dependencies krunner6
haikuporter -SG -j8 --no-source-packages --get-dependencies kstatusnotifieritem6 # new
haikuporter -SG -j8 --no-source-packages --get-dependencies ksvg6 # new
haikuporter -SG -j8 --no-source-packages --get-dependencies ktexteditor6
haikuporter -SG -j8 --no-source-packages --get-dependencies ktexttemplate6 # new
haikuporter -SG -j8 --no-source-packages --get-dependencies kunitconversion6
haikuporter -SG -j8 --no-source-packages --get-dependencies kuserfeedback6 # new
# modemmanager-qt
# networkmanager-qt
haikuporter -SG -j8 --no-source-packages --get-dependencies prison6
# SSO.OnlineAccounts
# KAccounts6 -> kaccounts_integration24
haikuporter -SG -j8 --no-source-packages --get-dependencies purpose6
haikuporter -SG -j8 --no-source-packages --get-dependencies qqc2_desktop_style6
# 70
