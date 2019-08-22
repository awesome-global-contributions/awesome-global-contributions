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
binDir="$rootDir/bin"
srcDir="$rootDir/src"
distDir="$rootDir/dist"

mkdir -p $distDir           # mkdir dist if needed

# aggregate yaml files, allow yml or yaml extensions
yq -n -f $binDir/concat_sdgs.jq $srcDir/*.y*ml > $distDir/projects_by_sdg.json
