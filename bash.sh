#!/usr/bin/env sh
set -e
RELEASES=4
BLUE='\033[0;34m'
NC='\033[0m'
HOME=~/dev/test-jenkins
NOW=$(date '+%Y%m%d%H%M%S')
mkdir -p  $HOME/build/releases/$NOW
echo "Make new release folder ${BLUE}$NOW"
if test ! -d $HOME/build/releases/$NOW; then echo "Directory does not exist '$HOME/build/releases/$NOW'"  1>&2; false; fi
cd $HOME/build/releases
echo "${NC}Removing release ${BLUE}$(ls -tp | tail -n +$RELEASES)"
ls -tp | tail -n +$RELEASES | xargs -I {} rm -rf -- {}
ln -sfn "$HOME/build/releases/$NOW" "$HOME/build/html"
cd $HOME
