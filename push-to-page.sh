#!/bin/bash

echo "build with jekyll"
bundle exec jekyll build
echo "store result in gh-pages branch"
cp -r _site /tmp/
git checkout gh-pages
git pull
rm -rf *
cp -r /tmp/_site/* .
rm -rf /tmp/_site
git add --all
git commit -m "update site"
git push
echo "done, switch to master…"
git checkout master
