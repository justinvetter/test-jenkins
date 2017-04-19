#!/usr/bin/env sh
set -e # Prevents script from running if there are any errors.
git stash save # Stashes everything away incase you didn't commit them
gulp # Step 2, insert your build script here
REV=`git rev-parse HEAD` # Gets commit hash as message
TAG=`git tag -l | tail -n1`
git checkout production # Step 3
git rm -rf . # Step 4
git checkout master -- .gitignore # Step 5
mv dist/* .
rm -rf dist # Step 6
git add . # Step 7
git commit -m "deployed $TAG at $REV" # Step 8
git push --all # Step 9
git push live production # Step 10
git checkout master # Step 11
git stash pop # Applies previously saved stash so you can continue working on changes. Once applied, removes stash