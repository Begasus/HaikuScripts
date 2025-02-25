#/bin/sh

source ~/config/settings/haikuports.conf

cd "$TREE_PATH"/dev-qt/

old_version="6.8.1"
new_version="6.8.2"

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

# replace CHECKSUM_SHA256 with new once
sed -i "s/$CHECKSUM_SHA256/`curl -sL $SOURCE_URI | sha256sum | head -c 64`/" $FNAME ; done

# the recipes should be built in this order

# 1 Part1
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_base
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_shadertools
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_declarative
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_connectivity
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_5compat
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_svg
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_multimedia
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_charts
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quicktimeline
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_datavis3d
# 10 Part2
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_imageformats
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_lottie
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_networkauth
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_serialport
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_positioning
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_location
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3d
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3dphysics
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_scxml
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_sensors
# 20 Part3
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_websockets
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webchannel
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webview
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_tools
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_translations
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_speech
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_3d
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_doc
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_examples
