#/bin/sh

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

export CMAKE_FLAGS="-DBUILD_TESTING=OFF"

#/bin/sh
source ~/config/settings/haikuports.conf
# net-irc
cd "$TREE_PATH"/kde-frameworks/

old_version="5.115.0"
new_version="5.116.0"

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

# 1
	#haikuporter -SG -j8 --no-source-packages --get-dependencies extra_cmake_modules
	#haikuporter -SG -j8 --no-source-packages --get-dependencies phonon
haikuporter -SG -j8 --no-source-packages --get-dependencies ki18n
haikuporter -SG -j8 --no-source-packages --get-dependencies kconfig
haikuporter -SG -j8 --no-source-packages --get-dependencies kcoreaddons
haikuporter -SG -j8 --no-source-packages --get-dependencies kcodecs
haikuporter -SG -j8 --no-source-packages --get-dependencies karchive
haikuporter -SG -j8 --no-source-packages --get-dependencies kwidgetsaddons
haikuporter -SG -j8 --no-source-packages --get-dependencies kguiaddons #KF5
	#haikuporter -SG -j8 --no-source-packages --get-dependencies breeze_icons
# 10
haikuporter -SG -j8 --no-source-packages --get-dependencies kdoctools
haikuporter -SG -j8 --no-source-packages --get-dependencies kwindowsystem
haikuporter -SG -j8 --no-source-packages --get-dependencies kcompletion
haikuporter -SG -j8 --no-source-packages --get-dependencies kdbusaddons
haikuporter -SG -j8 --no-source-packages --get-dependencies kitemviews
haikuporter -SG -j8 --no-source-packages --get-dependencies knotifications
	# gpgme (for qt5)
	# qca (qt5)
haikuporter -SG -j8 --no-source-packages --get-dependencies kcrash
haikuporter -SG -j8 --no-source-packages --get-dependencies kservice
haikuporter -SG -j8 --no-source-packages --get-dependencies kauth
haikuporter -SG -j8 --no-source-packages --get-dependencies kconfigwidgets
# 20
haikuporter -SG -j8 --no-source-packages --get-dependencies kiconthemes
haikuporter -SG -j8 --no-source-packages --get-dependencies kjobwidgets
haikuporter -SG -j8 --no-source-packages --get-dependencies kwallet #KF5 # qca
haikuporter -SG -j8 --no-source-packages --get-dependencies solid
haikuporter -SG -j8 --no-source-packages --get-dependencies sonnet
haikuporter -SG -j8 --no-source-packages --get-dependencies kglobalaccel #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies kirigami
haikuporter -SG -j8 --no-source-packages --get-dependencies ktextwidgets
haikuporter -SG -j8 --no-source-packages --get-dependencies kxmlgui
haikuporter -SG -j8 --no-source-packages --get-dependencies kbookmarks
# 30
haikuporter -SG -j8 --no-source-packages --get-dependencies kio #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies kdeclarative
haikuporter -SG -j8 --no-source-packages --get-dependencies kcmutils
# poppler_qt6
haikuporter -SG -j8 --no-source-packages --get-dependencies attica
haikuporter -SG -j8 --no-source-packages --get-dependencies kpackage
haikuporter -SG -j8 --no-source-packages --get-dependencies syndication
haikuporter -SG -j8 --no-source-packages --get-dependencies kcontacts
# libQMobipocket
haikuporter -SG -j8 --no-source-packages --get-dependencies kfilemetadata
haikuporter -SG -j8 --no-source-packages --get-dependencies kidletime
haikuporter -SG -j8 --no-source-packages --get-dependencies kitemmodels
# 40
haikuporter -SG -j8 --no-source-packages --get-dependencies knewstuff
haikuporter -SG -j8 --no-source-packages --get-dependencies kparts
haikuporter -SG -j8 --no-source-packages --get-dependencies kpty
haikuporter -SG -j8 --no-source-packages --get-dependencies ksyntax_highlighting
haikuporter -SG -j8 --no-source-packages --get-dependencies threadweaver
haikuporter -SG -j8 --no-source-packages --get-dependencies baloo #KF5
haikuporter -SG -j8 --no-source-packages --get-dependencies frameworkintegration
haikuporter -SG -j8 --no-source-packages --get-dependencies kcalendarcore
haikuporter -SG -j8 --no-source-packages --get-dependencies kdav
haikuporter -SG -j8 --no-source-packages --get-dependencies kdesu
# 50
haikuporter -SG -j8 --no-source-packages --get-dependencies kdnssd
haikuporter -SG -j8 --no-source-packages --get-dependencies kholidays
haikuporter -SG -j8 --no-source-packages --get-dependencies kimageformats
haikuporter -SG -j8 --no-source-packages --get-dependencies knotifyconfig
haikuporter -SG -j8 --no-source-packages --get-dependencies kpeople
haikuporter -SG -j8 --no-source-packages --get-dependencies kplotting
haikuporter -SG -j8 --no-source-packages --get-dependencies kquickcharts
haikuporter -SG -j8 --no-source-packages --get-dependencies krunner
haikuporter -SG -j8 --no-source-packages --get-dependencies ktexteditor
haikuporter -SG -j8 --no-source-packages --get-dependencies kunitconversion
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kuserfeedback
# 60
haikuporter -SG -j8 --no-source-packages --get-dependencies prison
haikuporter -SG -j8 --no-source-packages --get-dependencies purpose
haikuporter -SG -j8 --no-source-packages --get-dependencies qqc2_desktop_style
haikuporter -SG -j8 --no-source-packages --get-dependencies kemoticons
haikuporter -SG -j8 --no-source-packages --get-dependencies kinit
haikuporter -SG -j8 --no-source-packages --get-dependencies kded
haikuporter -SG -j8 --no-source-packages --get-dependencies kdelibs4support # portingAids
haikuporter -SG -j8 --no-source-packages --get-dependencies kdesignerplugin # portingAids
haikuporter -SG -j8 --no-source-packages --get-dependencies kjs # portingAids
haikuporter -SG -j8 --no-source-packages --get-dependencies kdewebkit # portingAids
# 70
haikuporter -SG -j8 --no-source-packages --get-dependencies khtml # portingAids
haikuporter -SG -j8 --no-source-packages --get-dependencies kross # portingAids
#haikuporter -SG -j8 --no-source-packages --get-dependencies kjsembed # portingAids
#haikuporter -SG -j8 --no-source-packages --get-dependencies kmediaplayer # portingAids
#haikuporter -SG -j8 --no-source-packages --get-dependencies kxmlrpcclient # portingAids

# plasma
haikuporter -SG -j8 --no-source-packages --get-dependencies kactivities
haikuporter -SG -j8 --no-source-packages --get-dependencies kactivities_stats
haikuporter -SG -j8 --no-source-packages --get-dependencies plasma



