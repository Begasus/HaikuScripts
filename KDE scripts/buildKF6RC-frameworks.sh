#/bin/sh

source ~/config/settings/haikuports.conf
# net-irc
cd "$TREE_PATH"/kde-frameworks/

old_version="6.10.0"
new_version="6.11.0~rc1"

# bump recipe filenames
find . -maxdepth 2 -type f -name "*$old_version*.recipe" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# bump patchset filenames
find . -maxdepth 3 -type f -name "*$old_version*.patchset" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# reset revision
find . -maxdepth 2 -type f -name "*$new_version*.recipe" | grep -v " 1 " |
while read fname; do sed -i "/^REVISION=/s/=.*/=\"1\"/" */*.recipe; done

# print SOURCE_URI recipe file name
find . -maxdepth 2 -name "*$new_version*.recipe" | while read FNAME; do \
portVersion=$new_version ; source $FNAME ; echo $SOURCE_URI $FNAME ;

# reset to unstable URI
sed -i "s|stable|unstable|g" $FNAME ;

# replace CHECKSUM_SHA256 with new once
sed -i "s/$CHECKSUM_SHA256/`curl -sL $SOURCE_URI | sha256sum | head -c 64`/" $FNAME ; done

# $libVersion is not the same as $portVersion
# libVersion="${portVersion/\~rc1/}"

# disable rpath
#		-DCMAKE_SKIP_RPATH=YES \

# the recipes should be built in this order

# folowing kdesrc-build policy: kdesrc-build frameworks

# 1 Part1
#haikuporter -SG -j8 --no-source-packages --get-dependencies extra_cmake_modules
#haikuporter -G -j8 --no-source-packages --get-dependencies breeze_icons
#haikuporter -SG -j8 --no-source-packages --get-dependencies ki18n6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kconfig6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcoreaddons6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcodecs6
#haikuporter -SG -j8 --no-source-packages --get-dependencies karchive6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kwidgetsaddons6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kguiaddons6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcolorscheme6
# 10 Part2
#haikuporter -SG -j8 --no-source-packages --get-dependencies kconfigwidgets6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdoctools6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kiconthemes6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kwindowsystem6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcompletion6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdbusaddons6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kitemviews6
#haikuporter -SG -j8 --no-source-packages --get-dependencies knotifications6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcrash6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kservice6
# 20 Part3
#haikuporter -SG -j8 --no-source-packages --get-dependencies kauth6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kbookmarks6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kirigami6 # send patch upstream?
#haikuporter -SG -j8 --no-source-packages --get-dependencies kjobwidgets6
	# libgpg_error-1.47 (for gpgmepp-1.23.2), qca-2.3.9 (qt6)
#haikuporter -SG -j8 --no-source-packages --get-dependencies kwallet6
#haikuporter -SG -j8 --no-source-packages --get-dependencies solid6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kded6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kio6 #KF5
#haikuporter -SG -j8 --no-source-packages --get-dependencies sonnet6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kglobalaccel6
# 30 Part4
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktextwidgets6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kxmlgui6 #needs kglobalaccel?
#haikuporter -SG -j8 --no-source-packages --get-dependencies attica6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kpackage6
#haikuporter -SG -j8 --no-source-packages --get-dependencies syndication6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcontacts6
	# libQMobipocket6, poppler_qt6-24.08.0
#haikuporter -SG -j8 --no-source-packages --get-dependencies kfilemetadata6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kidletime6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kitemmodels6
#haikuporter -SG -j8 --no-source-packages --get-dependencies knewstuff6
# 40 Part5
#haikuporter -SG -j8 --no-source-packages --get-dependencies kparts6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kpty6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ksyntax_highlighting6
#haikuporter -SG -j8 --no-source-packages --get-dependencies threadweaver6
#haikuporter -SG -j8 --no-source-packages --get-dependencies baloo6
	#haikuporter -SG -j8 --no-source-packages --get-dependencies bluez_qt6
#haikuporter -SG -j8 --no-source-packages --get-dependencies frameworkintegration6
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kapidox6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcalendarcore6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcmutils6
# 50 Part6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdav6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdeclarative6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdesu6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdnssd6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kholidays6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kimageformats6 # needs newer libjxl (devel:libheif$secondaryArchSuffix?)
#haikuporter -SG -j8 --no-source-packages --get-dependencies knotifyconfig6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kpeople6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kplotting6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kquickcharts6
# 60 Part7
#haikuporter -SG -j8 --no-source-packages --get-dependencies kstatusnotifieritem6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ksvg6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktexteditor6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktexttemplate6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kunitconversion6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kuserfeedback6
#haikuporter -SG -j8 --no-source-packages --get-dependencies prison6
	# SSO.OnlineAccounts -> accounts-qml # not yet
	# KAccounts6 -> kaccounts_integration24 + kaccounts_providers24
#haikuporter -SG -j8 --no-source-packages --get-dependencies purpose6
#haikuporter -SG -j8 --no-source-packages --get-dependencies qqc2_desktop_style6 # doesn't need kglobalaccel?
#haikuporter -SG -j8 --no-source-packages --get-dependencies krunner6
