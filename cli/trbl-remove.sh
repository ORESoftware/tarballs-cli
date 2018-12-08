#!/usr/bin/env bash


set -e;

mkdir -p "$HOME/.trbl/repos";

name="$1";

if [ -z "$name" ]; then
   echo "You need to include a repo name to remove.";
   exit 1;
fi

if [ ! -d "$HOME/.trbl/repos/$name" ]; then
    echo "failed: could not remove - no directory- '$PWD/$name'";
    exit 1;
fi

rm -rf "$HOME/.trbl/repos/$name" && {
    echo "removed: $PWD/$name";
    exit 0;
} || {
    echo "failed: could not remove - '$PWD/$name'";
    exit 1;
}
