#/bin/sh

source ~/config/settings/haikuports.conf
cd "$TREE_PATH"/kde-plasma/

old_version="6.2.5"
new_version="6.3.0"

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

haikuporter -SG -j8 --no-source-packages --get-dependencies kdecoration6
haikuporter -SG -j8 --no-source-packages --get-dependencies breeze6
haikuporter -SG -j8 --no-source-packages --get-dependencies kde_cli_tools6
#haikuporter -SG -j8 --no-source-packages --get-dependencies libplasma6
haikuporter -SG -j8 --no-source-packages --get-dependencies plasma_activities6
haikuporter -SG -j8 --no-source-packages --get-dependencies plasma_activities_stats6
haikuporter -SG -j8 --no-source-packages --get-dependencies plasmawayland_protocols
