#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/conf";

current_repo="$1"

if [ -z "$current_repo" ]; then
  echo "First argument needs to be name.";
  exit 1;
fi

echo "$current_repo" > "$HOME/.trbl/conf/current_repo.json"
