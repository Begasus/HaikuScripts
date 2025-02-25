#/bin/sh

# first uninstall devel packages from previous version
cd /system/packages
pkgman uninstall *_devel-6.19.0 -y
pkgman uninstall *_doc-6.19.0 -y

# set path to haikuports/packages
source ~/config/settings/haikuports.conf
#cd "$TREE_PATH"/packages/
cd /Opslag/backup/KDE/frameworks/6.24.0

# the recipes should be installed in this order

# 1 Part1
pkgman install ./extra_cmake_modules* -y
pkgman install ./breeze_icons* -y
# KF6-part1
pkgman install ./ki18n6* -y
pkgman install ./kconfig6* -y
pkgman install ./kcoreaddons6* -y
pkgman install ./kcodecs6* -y
pkgman install ./karchive6* -y
pkgman install ./kwidgetsaddons6* -y
pkgman install ./kguiaddons6* -y
pkgman install ./kcolorscheme6* -y
# 10 Part2
# KF6-part2
pkgman install ./kconfigwidgets6* -y
#pkgman install ./kdoctools6* -y
pkgman install ./kiconthemes6* -y
pkgman install ./kwindowsystem6* -y
pkgman install ./kcompletion6* -y
pkgman install ./kdbusaddons6* -y
pkgman install ./kitemviews6* -y
pkgman install ./knotifications6* -y
pkgman install ./kcrash6* -y
pkgman install ./kservice6* -y
# 20 Part3
# KF6-part3
pkgman install ./kauth6* -y
pkgman install ./kbookmarks6* -y
pkgman install ./kjobwidgets6* -y
	# libgpg_error-1.47 (for gpgmepp-1.23.2), qca-2.3.9 (qt6)
pkgman install ./kwallet6* -y
pkgman install ./solid6* -y
pkgman install ./kded6* -y
pkgman install ./kio6* -y #KF5
pkgman install ./sonnet6* -y
# pkgman install ./kglobalaccel6* -y
pkgman install ./kirigami6* -y
# 30 Part4
# KF6-part4
pkgman install ./ktextwidgets6* -y
pkgman install ./kxmlgui6* -y
pkgman install ./attica6* -y
pkgman install ./kpackage6* -y
pkgman install ./syndication6* -y
pkgman install ./kcontacts6* -y
#	pkgman install ./kdegraphics_mobipocket_kf6* -y
pkgman install ./kfilemetadata6* -y
pkgman install ./kidletime6* -y
pkgman install ./kitemmodels6* -y
pkgman install ./knewstuff6* -y
# 40 Part5
# KF6-part5
pkgman install ./kparts6* -y
pkgman install ./kpty6* -y
pkgman install ./ksyntax_highlighting6* -y
pkgman install ./threadweaver6* -y
pkgman install ./baloo6* -y
# pkgman install ./bluez_qt6* -y
pkgman install ./frameworkintegration6* -y
# pkgman install ./kapidox6* -y
pkgman install ./kcalendarcore6* -y
pkgman install ./kcmutils6* -y
# 50 Part6
# KF6-part6
pkgman install ./kdav6* -y
pkgman install ./kdeclarative6* -y
pkgman install ./kdesu6* -y
pkgman install ./kdnssd6* -y
pkgman install ./kholidays6* -y
pkgman install ./kimageformats6* -y
pkgman install ./knotifyconfig6* -y
pkgman install ./kpeople6* -y
pkgman install ./kplotting6* -y
pkgman install ./kquickcharts6* -y
# 60 Part7
# KF6-part7
pkgman install ./kstatusnotifieritem6* -y
pkgman install ./ksvg6* -y
pkgman install ./ktexteditor6* -y
pkgman install ./ktexttemplate6* -y
pkgman install ./kunitconversion6* -y
pkgman install ./kuserfeedback6* -y
pkgman install ./prison6* -y
#	pkgman install ./kaccounts_integration_kf6* -y
#	pkgman install ./kaccounts_providers_kf6* -y
pkgman install ./purpose6* -y
pkgman install ./qqc2_desktop_style6* -y
#	pkgman install ./krunner6* -y
