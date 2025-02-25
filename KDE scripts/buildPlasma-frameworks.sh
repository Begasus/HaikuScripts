#/bin/sh

# build in this order

haikuporter -SG -j8 --no-source-packages --get-dependencies kdecoration6
haikuporter -SG -j8 --no-source-packages --get-dependencies breeze6
haikuporter -SG -j8 --no-source-packages --get-dependencies kde_cli_tools6
haikuporter -SG -j8 --no-source-packages --get-dependencies plasma_activities6		 #boost! #patchset
haikuporter -SG -j8 --no-source-packages --get-dependencies plasma_activities_stats6
haikuporter -SG -j8 --no-source-packages --get-dependencies qqc2_breeze_style

# haikuporter -SG -j8 --no-source-packages --get-dependencies plasmawayland_protocols #check: https://download.kde.org/stable/plasma-wayland-protocols/
haikuporter -SG -j8 --no-source-packages --get-dependencies libplasma6
haikuporter -SG -j8 --no-source-packages --get-dependencies aurorae6
haikuporter -SG -j8 --no-source-packages --get-dependencies kactivitymanagerd6
haikuporter -SG -j8 --no-source-packages --get-dependencies kglobalacceld6
haikuporter -SG -j8 --no-source-packages --get-dependencies knighttime6
haikuporter -SG -j8 --no-source-packages --get-dependencies kwayland6
haikuporter -SG -j8 --no-source-packages --get-dependencies layer_shell_qt6
# haikuporter -SG -j8 --no-source-packages --get-dependencies libkscreen6 #broken
haikuporter -SG -j8 --no-source-packages --get-dependencies milou6
haikuporter -SG -j8 --no-source-packages --get-dependencies union
