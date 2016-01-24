#/bin/sh

rm -rf _book

gitbook build ./ --output=/Users/zzhoo8/Project/zzhoo8.github.io/

mv _book/* /Users/zzhoo8/Project/zzhoo8.github.io/

