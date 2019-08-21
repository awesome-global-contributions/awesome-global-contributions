#!/bin/bash
#
# yaml2markdown
#
# Usage: ./bin/yaml2markdown.sh
#
# Required packages:
# * https://github.com/kislyuk/yq
#

# dir paths
rootDir="$(cd `dirname $0` && dirname "$(pwd)")"
srcDir="$rootDir/src"
distDir="$rootDir/dist"

# mkdir dist if needed
mkdir -p $distDir

# aggregate yaml files
cat $srcDir/*.y*ml | # allow yml or yaml extenions
    yq '.'
