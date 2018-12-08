#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/conf";

current_repo="$1"

if [ -z "$current_repo" ]; then
  echo "First argument needs to be name." >&2;
  exit 1;
fi


dir="$HOME/.trbl/repos/$current_repo";

if [ ! -d  "$dir" ]; then
  echo "No directory exists at this path: '$dir'" >&2;
  exit 1;
fi


echo "$current_repo" > "$HOME/.trbl/conf/current_repo.json"


