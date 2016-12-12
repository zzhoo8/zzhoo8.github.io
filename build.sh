#/bin/sh

gitbook build ./ --output=/Users/zzhoo8/Projects/zzhoo8.github.io/

cp -rf _book/* /Users/zzhoo8/Projects/zzhoo8.github.io/

rm -r _book
