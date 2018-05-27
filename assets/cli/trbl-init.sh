#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";
name="$1";
repo="$2";

if [ -z "$name" ]; then
   echo "You need to include a unique name for your repo as a first argument.";
   echo "You need to include a git repo as the second argument.";
   exit 1;
fi

if [ -z "$repo" ]; then
   echo "You need to include a git repo as the second argument.";
   exit 1;
fi


(
  cd "$HOME/.trbl/repos"
  ( git clone "$repo" "$name" > /dev/null)
  trbl use "$name";
  echo "$PWD/$name";
)
