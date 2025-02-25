#/bin/sh

# the recipes should be built in this order

# 1 Part1
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_base
#haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_haikuplugins
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_shadertools
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_svg
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_languageserver
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_declarative
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_connectivity
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quicktimeline
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3d
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_multimedia
# 10 Part2
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_charts
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_datavis3d
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_imageformats
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_lottie
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_networkauth
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_serialport
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_positioning
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_location
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_quick3dphysics
# 20 Part3
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_scxml
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_sensors
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_websockets
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webchannel
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_webview
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_tools
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_5compat
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_speech
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_3d
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_translations
# 30 Part4
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_doc
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_examples
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_qtmqtt
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_graphs
# Extra not pushed
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_serialbus
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_httpserver
haikuporter -SG -j8 --no-source-packages --get-dependencies qt6_remoteobjects
