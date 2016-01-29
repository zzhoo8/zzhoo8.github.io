#/bin/sh

gitbook build ./ --output=/Users/zzhoo8/Project/zzhoo8.github.io/

cp -rf _book/* /Users/zzhoo8/Project/zzhoo8.github.io/

rm -r _book
