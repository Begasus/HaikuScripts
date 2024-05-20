#/bin/sh
source ~/config/settings/haikuports.conf
# net-irc
cd "$TREE_PATH"/packages/

# first uninstall devel package

# the recipes should be installed in this order

pkgman install ./extra_cmake_modules*6.2.0-1*  -y
#pkgman install ./phonon6*4.12.0*  -y
pkgman install ./karchive6*6.2.0-1*  -y
pkgman install ./kcodecs6*6.2.0-1*  -y
pkgman install ./kconfig6*6.2.0-1*  -y
pkgman install ./kcoreaddons6*6.2.0-1*  -y
pkgman install ./kdbusaddons6*6.2.0-1*  -y
#pkgman install ./kguiaddons*5.115.0*  -y #KF5
pkgman install ./kguiaddons6*6.2.0-1*  -y #KF5
# first uninstall devel package
pkgman install ./ki18n6*6.2.0-1*  -y
pkgman install ./kitemmodels6*6.2.0-1*  -y
pkgman install ./kitemviews6*6.2.0-1*  -y
pkgman install ./kwidgetsaddons6*6.2.0-1*  -y
pkgman install ./kwindowsystem6*6.2.0-1*  -y
pkgman install ./solid6*6.2.0-1*  -y
pkgman install ./sonnet6*6.2.0-1*  -y
pkgman install ./threadweaver6*6.2.0-1*  -y
pkgman install ./kauth6*6.2.0-1*  -y
pkgman install ./kcompletion6*6.2.0-1*  -y
pkgman install ./kcrash6*6.2.0-1*  -y
pkgman install ./kdoctools6*6.2.0-1*  -y
pkgman install ./kunitconversion6*6.2.0-1*  -y
pkgman install ./kcolorscheme6*6.2.0-1*  -y # new
pkgman install ./kconfigwidgets6*6.2.0-1*  -y
# first uninstall devel package
pkgman install ./kservice6*6.2.0-1*  -y
#pkgman install ./kglobalaccel*5.115.0*  -y #KF5
pkgman install ./kglobalaccel6*6.2.0-1*  -y #KF5
pkgman install ./kpackage6*6.2.0-1*  -y
pkgman install ./kiconthemes6*6.2.0-1*  -y
pkgman install ./knotifications6*6.2.0-1*  -y
pkgman install ./kjobwidgets6*6.2.0-1*  -y
pkgman install ./ktextwidgets6*6.2.0-1*  -y
pkgman install ./kxmlgui6*6.2.0-1*  -y
pkgman install ./kbookmarks6*6.2.0-1*  -y
#pkgman install ./kwallet*5.115.0*  -y #KF5
pkgman install ./kwallet6*6.2.0-1*  -y #KF5
#pkgman install ./kio*5.115.0*  -y #KF5
pkgman install ./kio6*6.2.0-1*  -y #KF5
pkgman install ./kdeclarative6*6.2.0-1*  -y
pkgman install ./kirigami6*6.2.0-1*  -y
pkgman install ./kcmutils6*6.2.0-1*  -y
pkgman install ./knotifyconfig6*6.2.0-1*  -y
pkgman install ./kparts6*6.2.0-1*  -y
pkgman install ./kded6*6.2.0-1*  -y
pkgman install ./kplotting6*6.2.0-1*  -y
pkgman install ./breeze_icons*6.2.0-1*  -y
pkgman install ./kdiagram3*3.0.1*  -y
pkgman install ./attica6*6.2.0-1*  -y
pkgman install ./kdnssd6*6.2.0-1*  -y

# manually build kdegraphics_mobipocket24
pkgman install ./kdegraphics_mobipocket24*24.02.2* -y
pkgman install ./kfilemetadata6*6.2.0-1*  -y
pkgman install ./kholidays6*6.2.0-1*  -y
pkgman install ./kidletime6*6.2.0-1*  -y

# could use support for libaom in libavif1.0 (2 test failing with a mention there)
pkgman install ./kimageformats6*6.2.0-1*  -y
pkgman install ./syndication6*6.2.0-1*  -y
pkgman install ./knewstuff6*6.2.0-1*  -y
pkgman install ./ksyntax_highlighting6*6.2.0-1*  -y
pkgman install ./ktexteditor6*6.2.0-1*  -y
pkgman install ./kpty6*6.2.0-1*  -y
pkgman install ./qqc2_desktop_style6*6.2.0-1*  -y
pkgman install ./prison6*6.2.0-1*  -y
pkgman install ./purpose6*6.2.0-1*  -y # kaccounts
pkgman install ./kcalendarcore6*6.2.0-1*  -y
pkgman install ./kcontacts6*6.2.0-1*  -y
pkgman install ./kpeople6*6.2.0-1*  -y
pkgman install ./kquickcharts6*6.2.0-1*  -y
#pkgman install ./baloo*5.115.0*  -y #KF5
pkgman install ./baloo6*6.2.0-1*  -y #KF5
pkgman install ./frameworkintegration6*6.2.0-1*  -y

# new
pkgman install ./kuserfeedback6*6.2.0-1*  -y
pkgman install ./ksvg6*6.2.0-1*  -y
pkgman install ./kstatusnotifieritem6*6.2.0-1*  -y
pkgman install ./ktexttemplate6*6.2.0-1*  -y
pkgman install ./bluez_qt6*6.2.0-1*  -y
pkgman install ./kdav6*6.2.0-1*  -y

#pkgman install ./kdesu*5.115.0*  -y
pkgman install ./kdesu6*6.2.0-1*  -y

# manually build plasma_activities6 kde-plasma
pkgman install ./plasma_activities6*6.0.4*  -y
pkgman install ./krunner6*6.2.0-1*  -y

# kde-plasma
pkgman install ./kdecoration6*6.0.4*  -y
pkgman install ./breeze6*6.0.4*  -y
pkgman install ./kde_cli_tools6*6.0.4*  -y
pkgman install ./plasma_activities_stats6*6.0.4*  -y
