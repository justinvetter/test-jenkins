#!/usr/bin/env sh
ssh justin.vetter@10.84.140.15 -i ~/.ssh/appsdg <<'ENDSSH'
set -e
RELEASES=4
BLUE='\033[0;34m'
NC='\033[0m'
HOME="/var/www/microsites/html/build-test"
CURRENT=$(ls -tp $HOME/releases | head -n 1)
BACK=$(ls -tp $HOME/releases | tail -n 2 | head -n 1)
echo "${NC}Rolling back ${BLUE}$CURRENT ${NC}to ${BLUE}$BACK"
ln -sfn "$HOME/releases/$BACK" "$HOME/html"
echo "${NC}Removing ${BLUE}$CURRENT"
cd $HOME/releases
rm -rf $CURRENT
ENDSSH
