#!/bin/bash
# DISCLAIMER:
# This installation script is intended not to do any harm, but the author makes
# no warranty that it certainly won't and/or perfectly fits your needs.

CURR_DIR="`pwd`"
BUNDLE_DIR="$CURR_DIR/bundle"

echo "Updating all addons:"

for i in `ls $BUNDLE_DIR`
do
    echo "Updating $i..."
    cd "$BUNDLE_DIR/$i"
    git pull origin >/dev/null 2>&1
done
