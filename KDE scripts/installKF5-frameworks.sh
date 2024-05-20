#/bin/sh
source ~/config/settings/haikuports.conf

cd "$TREE_PATH"/packages/

# first uninstall devel package

# the recipes should be installed in this order

	#pkgman install ./extra_cmake_modules*6.2.0-1*  -y
	#pkgman install ./ phonon*4.12.0*  -y
pkgman install ./ki18n*5.116.0-1*  -y
pkgman install ./kconfig*5.116.0-1*  -y
pkgman install ./kcoreaddons*5.116.0-1*  -y
pkgman install ./kcodecs*5.116.0-1*  -y
pkgman install ./karchive*5.116.0-1*  -y
pkgman install ./kwidgetsaddons*5.116.0-1*  -y
pkgman install ./kguiaddons*5.116.0-1*  -y #KF5
	#pkgman install ./breeze_icons*6.2.0-1*  -y
# 10
pkgman install ./kdoctools*5.116.0-1*  -y
pkgman install ./kwindowsystem*5.116.0-1*  -y
pkgman install ./kcompletion*5.116.0-1*  -y
pkgman install ./kdbusaddons*5.116.0-1*  -y
pkgman install ./kitemviews*5.116.0-1*  -y
pkgman install ./knotifications*5.116.0-1*  -y
	# gpgme (for qt5)
	# qca (qt5)
pkgman install ./kcrash*5.116.0-1*  -y
pkgman install ./kservice*5.116.0-1*  -y
pkgman install ./kauth*5.116.0-1*  -y
pkgman install ./kconfigwidgets*5.116.0-1*  -y
# 20
pkgman install ./kiconthemes*5.116.0-1*  -y
pkgman install ./kjobwidgets*5.116.0-1*  -y
pkgman install ./kwallet*5.116.0-1*  -y #KF5 # qca
pkgman install ./solid*5.116.0-1*  -y
pkgman install ./sonnet*5.116.0-1*  -y
pkgman install ./kglobalaccel*5.116.0-1*  -y #KF5
pkgman install ./kirigami*5.116.0-1*  -y
pkgman install ./ktextwidgets*5.116.0-1*  -y
pkgman install ./kxmlgui*5.116.0-1*  -y
pkgman install ./kbookmarks*5.116.0-1*  -y
# 30
pkgman install ./kio*5.116.0-1*  -y #KF5
pkgman install ./kdeclarative*5.116.0-1*  -y
pkgman install ./kcmutils*5.116.0-1*  -y
# poppler_qt6
pkgman install ./attica*5.116.0-1*  -y
pkgman install ./kpackage*5.116.0-1*  -y
pkgman install ./syndication*5.116.0-1*  -y
pkgman install ./kcontacts*5.116.0-1*  -y
# libQMobipocket*23.08.5-1*  -y
pkgman install ./kfilemetadata*5.116.0-1*  -y
pkgman install ./kidletime*5.116.0-1*  -y
pkgman install ./kitemmodels*5.116.0-1*  -y
# 40
pkgman install ./knewstuff*5.116.0-1*  -y
pkgman install ./kparts*5.116.0-1*  -y
pkgman install ./kpty*5.116.0-1*  -y
pkgman install ./ksyntax_highlighting*5.116.0-1*  -y
pkgman install ./threadweaver*5.116.0-1*  -y
pkgman install ./baloo*5.116.0-1*  -y #KF5
pkgman install ./frameworkintegration*5.116.0-1*  -y
pkgman install ./kcalendarcore*5.116.0-1*  -y
pkgman install ./kdav*5.116.0-1*  -y
pkgman install ./kdesu*5.116.0-1*  -y
# 50
pkgman install ./kdnssd*5.116.0-1*  -y
pkgman install ./kholidays*5.116.0-1*  -y
pkgman install ./kimageformats*5.116.0-1*  -y
pkgman install ./knotifyconfig*5.116.0-1*  -y
pkgman install ./kpeople*5.116.0-1*  -y
pkgman install ./kplotting*5.116.0-1*  -y
pkgman install ./kquickcharts*5.116.0-1*  -y
pkgman install ./ktexteditor*5.116.0-1*  -y
pkgman install ./kunitconversion*5.116.0-1*  -y
	#pkgman install ./kuserfeedback*1.3.0-1*  -y
# 60
pkgman install ./prison*5.116.0-1*  -y
pkgman install ./purpose*5.116.0-1*  -y
pkgman install ./qqc2_desktop_style*5.116.0-1*  -y
pkgman install ./kemoticons*5.116.0-1*  -y
pkgman install ./kinit*5.116.0-1*  -y
pkgman install ./kded*5.116.0-1*  -y
pkgman install ./kdelibs4support*5.116.0-1*  -y # portingAids
pkgman install ./kdesignerplugin*5.116.0-1*  -y # portingAids
pkgman install ./kjs*5.116.0-1*  -y # portingAids
pkgman install ./kdewebkit*5.116.0-1*  -y # portingAids
# 70
pkgman install ./khtml*5.116.0-1*  -y # portingAids
pkgman install ./kross*5.116.0-1*  -y # portingAids
#pkgman install ./kjsembed # portingAids
#pkgman install ./kmediaplayer # portingAids
#pkgman install ./kxmlrpcclient # portingAids

# plasma
pkgman install ./kactivities*5.116.0-1*  -y
pkgman install ./kactivities_stats*5.116.0-1*  -y
pkgman install ./plasma*5.116.0-1*  -y
# krunner needs plasma
pkgman install ./krunner*5.116.0-1*  -y
