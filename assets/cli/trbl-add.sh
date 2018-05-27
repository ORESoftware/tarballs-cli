#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";
mkdir -p "$HOME/.trbl/conf";

current_repo=`cat "$HOME/.trbl/conf/current_repo.json"`;
file="$1";

if [ -z "$current_repo" ]; then
   echo "no current_repo -> try this '$ trbl use x'";
   exit 1;
fi


(
  set -e;
  cd "$HOME/.trbl/repos/$current_repo"
  git fetch origin;
  git reset --hard origin/master;
  mkdir -p "tgz"
  cat "$file" > "./tgz/zoom.tgz"
  git add  "./tgz/zoom.tgz"
  git commit -m "added ./tgz/zoom.tgz";
  git push -u origin master;
)
