#!python3

"""
Usage:

> compare_package.py package_name

Compares contents (disregarding files' sizes and timestamps) of the given package_name from:

    /system/packages/package_name-*.hpkg

with the one from:

    $TREE_PATH/packages/package_name-*.hpkg

Where $TREE_PATH is the location of haikuports' tree (taken from `haikuporter.conf`).

Useful to see, at first glance, if our newly built package looks more or less like the older ones.
"""

from dataclasses import dataclass
from pprint import pprint

import os
import re
import subprocess
import sys


def usage():
    print(__doc__)
    exit()


def call(what, check_rc=True, shell=True):
    """Returns the text output of calling the `what` in a subprocess.
    
    set check_rc=False if the subprocess may fail (and you can handle that).
    """
    if check_rc:
        return subprocess.check_output([what], shell=shell, text=True)
    return subprocess.run([what], stdout=subprocess.PIPE, shell=shell, text=True).stdout


def get_package_filenames(package_name):
    """Returns a 2 items tuple of the first .hpkg filename that matches `package_name`.

    The first item from `/system/packages/`, the second from haikuporter's $TREE_PATH.
    """
    system = call('ls -1 /system/packages/%s-*.hpkg' % package_name, check_rc=False)
    local = call('ls -1 %s/%s-*.hpkg' % (get_hp_root(), package_name), check_rc=False)

    if system != '':
        system = system.splitlines()[0]
    if local != '':
        local = local.splitlines()[0]

    return system, local


def get_hp_root():
    result = call('source ~/config/settings/haikuports.conf && echo $TREE_PATH').splitlines()[0]
    return result + '/packages'


def diff(old, new):
    result = call('diff --color=always -u %s %s' % (old, new), check_rc=False)
    return result


def get_package_info(filename):
    PATTERN_TO_REMOVE=r"\s+\d+\s+\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2}\s+.*"

    lines = call('package list %s' % filename).splitlines()
    filtered_lines = []
    for l in lines:
        filtered_lines.append(re.sub(PATTERN_TO_REMOVE, '', l))

    filtered_lines.append('') # avoids "no newline at end of file" while diffing.

    return '\n'.join(filtered_lines)


def main(package_name):
    syspkg, localpkg = get_package_filenames(package_name)
    if not os.path.exists(syspkg):
        print('Cannot locate a package named "%s" under /system/packages/' % package_name)
        exit()
    elif not os.path.exists(localpkg):
        print('Cannot locate a package named "%s" under "%s"' % (package_name, get_hp_root()))
        exit()

    print('\nComparing package "%s" from files:\n\t%s\n\t%s\n' % (package_name, syspkg, localpkg))

    with open('/tmp/syspkg.txt', 'w') as of:
        of.writelines(get_package_info(syspkg))

    with open('/tmp/localpkg.txt', 'w') as nf:
        nf.writelines(get_package_info(localpkg))

    print(diff('/tmp/syspkg.txt', '/tmp/localpkg.txt'))

    os.unlink('/tmp/syspkg.txt')
    os.unlink('/tmp/localpkg.txt')


if __name__ == '__main__':
    if len(sys.argv) < 2:
        usage()
    package_name = sys.argv[1]
    main(package_name)
