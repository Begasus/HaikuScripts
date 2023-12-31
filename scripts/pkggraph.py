#!python3
#
# Copyright 2019-2023 Adrien Destugues <pulkomandy@pulkomandy.tk>
#
# Distributed under terms of the MIT license.

from os import listdir
from os.path import isfile, join
import subprocess
import re
import sys

"""
Generate a graph of dependencies for a set of packages packages in an Haiku system.

Usage:
- Without arguments: generate a graph of all packages in /system/packages. This can be quite busy
  and hard to understand. It will also take a while to generate the graph, as dot tries to route
  thousands of edges.
- With arguments: the arguments are a list of packages to analyze. This allows to print a subset
  of the packages for a better view.

Dependencies are resolved: if a package has a specific string in its REQUIRES and another has the
same string in its PROVIDES, a BLUE edge is drawn between the two package.
If a package has a REQUIRES that is not matched by any other package in the set, this REQUIRE entry
is drawn as a node, and the edge pointing to it is RED (so you can easily see missing dependencies
in a package subset). If you use the complete /system/packages hierarchy, there should be no red
edges, all dependencies are satisfied.

The output of the script can be saved to a file for manual analysis (for example, you can search
packages that nothing points to, and see if you want to uninstall them), or piped into dot for
rendering as a PNG, for example:

    cd /system/packages
    pkggraph.py qt* gst_plugins_ba* | dot -Tpng -o /tmp/packages.png
    ShowImage /tmp/packages.png
"""

path = "/system/packages"
if len(sys.argv) > 1:
    packages = sys.argv[1:]
else:
    packages = [join(path, f) for f in listdir(path) if(isfile(join(path, f)))]

print('strict digraph {\nrankdir="LR"\nsplines=ortho\nnode [ fontname="Noto", fontsize=10];')

pmap = {}
rmap = {}

for p in packages:
    pkgtool = subprocess.Popen(['package', 'list', '-i', p], stdout = subprocess.PIPE)
    infos, stderr = pkgtool.communicate()

    provides = []
    requires = []

    for line in infos.split(b'\n'):
        if line.startswith(b"\tprovides:"):
            provides.append(line.split(b' ')[1])
        if line.startswith(b"\trequires:"):
            line = line.split(b' ')[1]
            if b'>' in line:
                line = line.split(b'>')[0]
            if b'=' in line:
                line = line.split(b'=')[0]
            if line != b'haiku' and line != b'haiku_x86':
                requires.append(line)

    for pro in provides:
        pmap[pro] = provides[0]
    if len(requires) > 0:
        rmap[provides[0]] = requires

for k,v in rmap.items():
    for dep in v:
        color = "red"
        if dep in pmap:
            dep = pmap[dep]
            color = "blue"
        print('"%s" -> "%s" [color=%s]' % (k.decode('utf-8'), dep.decode('utf-8'), color))

print("}")
