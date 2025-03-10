#/bin/sh

# the recipes should be built in this order

# folowing kdesrc-build policy: kdesrc-build frameworks

# push first 2 before pushing the next ones

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
#haikuporter -SG -j8 --no-source-packages --get-dependencies kjobwidgets6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kwallet6
#haikuporter -SG -j8 --no-source-packages --get-dependencies solid6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kded6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kio6
#haikuporter -SG -j8 --no-source-packages --get-dependencies sonnet6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kglobalaccel6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kirigami6
# 30 Part4
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktextwidgets6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kxmlgui6
#haikuporter -SG -j8 --no-source-packages --get-dependencies attica6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kpackage6
#haikuporter -SG -j8 --no-source-packages --get-dependencies syndication6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcontacts6
	# libQMobipocket6, manual build/bump version ->
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kdegraphics_mobipocket24
	# libQMobipocket6 <-
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
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcalendarcore6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kcmutils6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdeclarative6
# 50 Part6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdesu6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdnssd6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kholidays6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kimageformats6
#haikuporter -SG -j8 --no-source-packages --get-dependencies knotifyconfig6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kpeople6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kplotting6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kstatusnotifieritem6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ksvg6
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktexteditor6
# 60 Part7
#haikuporter -SG -j8 --no-source-packages --get-dependencies ktexttemplate6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kunitconversion6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kuserfeedback6
#haikuporter -SG -j8 --no-source-packages --get-dependencies prison6
	# KAccounts6 ->
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kaccounts_integration24
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kaccounts_providers24
	# KAccounts6 <-
#haikuporter -SG -j8 --no-source-packages --get-dependencies purpose6
#haikuporter -SG -j8 --no-source-packages --get-dependencies qqc2_desktop_style6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kquickcharts6
#haikuporter -SG -j8 --no-source-packages --get-dependencies kdav6
#haikuporter -SG -j8 --no-source-packages --get-dependencies krunner6
	#haikuporter -SG -j8 --no-source-packages --get-dependencies kapidox6
