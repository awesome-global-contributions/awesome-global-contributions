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
binDir="$rootDir/bin"
srcDir="$rootDir/src"
distDir="$rootDir/dist"

# Generate json dist
bash $binDir/yaml2json.sh

# Generate README
readme=$rootDir/README.md
rm $readme
echo -e "<!--This file is automatically generated from yaml2markdown.sh -->\n\n" > $readme
vim $rootDir/README_TEMPLATE.md +",10w>>$readme|q"
python $binDir/generateReadme.py >> $readme