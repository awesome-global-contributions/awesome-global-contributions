#!/bin/bash
#
# yaml2json
#
# Usage: ./bin/yaml2json.sh
#
# Required packages:
# * https://github.com/kislyuk/yq
#

# dir paths
rootDir="$(cd `dirname $0` && dirname "$(pwd)")"
binDir="bin"
srcDir="src"
distDir="dist"

cd $rootDir                 # to work on windows
mkdir -p $distDir           # mkdir dist if needed

# aggregate yaml files, allow yml or yaml extensions
yq -n -f $binDir/concat_sdgs.jq $srcDir/*.y*ml > $distDir/projects_by_sdg.json
