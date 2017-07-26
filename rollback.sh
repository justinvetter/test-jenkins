#!/usr/bin/env sh
set -e
RELEASES=4
BLUE='\033[0;34m'
NC='\033[0m'
HOME=~/dev/test-jenkins
CURRENT=$(ls -tp $HOME/build/releases | head -n 1)
BACK=$(ls -tp $HOME/build/releases | tail -n 2 | head -n 1)
echo "${NC}Rolling back ${BLUE}$CURRENT ${NC}to ${BLUE}$BACK"
ln -sfn "$HOME/build/releases/$BACK" "$HOME/build/html"
echo "${NC}Removing ${BLUE}$CURRENT"
cd $HOME/build/releases
rm -rf $CURRENT
