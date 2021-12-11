#!/bin/sh

set -eu

# Various scripts dirs
SRC=$1
DESIRED=$2
DST=${HOME}/.local/share/weechat

# Read in the scripts file, ignoring comments and blank lines
grep -ohE "^[^#]+" $DESIRED/*.cfg | while read -r line; do
    lang=$(dirname "$line")
    fn=$(basename "$line")

    echo "Adding to autoload: $line"
    # Symlink the desired plugins so weechat can see them
    mkdir -p "$DST/$lang/autoload"
    ln -s "$SRC/$line" "$DST/$lang/autoload/$fn"
done
echo "Autoloading complete."
