#!/usr/bin/env sh
ssh justin.vetter@10.84.140.15 -i ~/.ssh/appsdg <<'ENDSSH'
set -e
RELEASES=4
BLUE='\033[0;34m'
NC='\033[0m'
NOW=$(date '+%Y%m%d%H%M%S')
HOME="/var/www/microsites/html/build-test"
TRAGET="/var/www/microsites/html/build-test/repo-cache"
GIT_DIR="/var/www/microsites/html/build-test/build-test.git"
BRANCH="production"

echo "Ref $ref received. Deploying ${BRANCH} branch to production..."
mkdir -p $HOME/repo-cache
git --work-tree=$TRAGET --git-dir=$GIT_DIR checkout $BRANCH -f
mkdir -p  $HOME/releases/$NOW
echo "Make new release folder ${BLUE}$NOW"
if test ! -d $HOME/releases/$NOW; then echo "Directory does not exist '$HOME/releases/$NOW'"  1>&2; false; fi
if test ! -d $HOME/repo-cache; then echo "Directory does not exist '$HOME/repo-cache'"  1>&2; false; fi
mv $HOME/repo-cache/* $HOME/releases/$NOW
rm -rf $HOME/repo-cache
cd $HOME/releases
echo "${NC}Removing release ${BLUE}$(ls -tp | tail -n +$RELEASES)"
ls -tp | tail -n +$RELEASES | xargs -I {} rm -rf -- {}
ln -sfn "$HOME/releases/$NOW" "$HOME/html"
cd $HOME
ENDSSH
