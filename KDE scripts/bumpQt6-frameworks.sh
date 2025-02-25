#/bin/sh

source ~/config/settings/haikuports.conf

cd "$TREE_PATH"/dev-qt/

old_version="6.10.2"
new_version="6.11.0"

# bump recipe filenames
find . -maxdepth 2 -type f -name "*$old_version*.recipe" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# bump patchset filenames
find . -maxdepth 3 -type f -name "*$old_version*.patchset" | grep -v " 1 " |
while read fname; do cp $fname ${fname//$old_version/$new_version}; done

# reset revision
find . -maxdepth 2 -type f -name "*$new_version*.recipe" | grep -v " 1 " |
while read fname; do sed -i "/^REVISION=/s/=.*/=\"1\"/" */*-$new_version*.recipe; done

# print SOURCE_URI recipe file name
find . -maxdepth 2 -name "*$new_version*.recipe" | while read FNAME; do \
portVersion=$new_version ; source $FNAME ; echo $SOURCE_URI $FNAME ;

# replace CHECKSUM_SHA256 with new once
sed -i "s/$CHECKSUM_SHA256/`curl -sL $SOURCE_URI | sha256sum | head -c 64`/" $FNAME ; done

# the recipes should be built in this order

# 1 Part1
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_base
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_haikuplugins
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_shadertools
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_svg
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_languageserver
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_declarative
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quicktimeline
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3d
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_multimedia
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_charts
# 10 Part2
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_datavis3d
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_imageformats
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_lottie
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_networkauth
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_serialport
	#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_serialbus
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_positioning
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_location
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3dphysics
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_scxml
# 20 Part3
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_sensors
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_websockets
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webchannel
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webview
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_tools

#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_5compat
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_translations
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_speech
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_3d
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_doc
# 30 Part4
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_examples
	#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_connectivity
# Extra not pushed
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6-graphs
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6-httpserver
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6-remoteobjects

#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_qtmqtt