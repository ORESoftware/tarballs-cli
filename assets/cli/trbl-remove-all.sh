#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";

rm -rf "$HOME/.trbl/repos" &&  mkdir -p "$HOME/.trbl/repos" && {
    echo "removed all repos";
    exit 0;
} || {
    echo "failed: could not remove - '$PWD/$name'";
    exit 1;
}
