#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";
mkdir -p "$HOME/.trbl/conf";

current_repo=`cat "$HOME/.trbl/conf/current_repo.json"`;
file="$1";
file_name="$2";

if [ -z "$current_repo" ]; then
   echo "no current_repo -> try this '$ trbl use x'";
   exit 1;
fi

if [ -z "$file" ]; then
   echo "no file passed -> please pass a file as the first argument.";
   echo "no file name -> please pass a file name as the second argument.";
   exit 1;
fi

if [ -z "$file_name" ]; then
   echo "no file name -> please pass a file name as the second argument.";
   exit 1;
fi


(
  set -e;
  cd "$HOME/.trbl/repos/$current_repo"
  git fetch origin;
  git reset --hard origin/master;
  mkdir -p "$(dirname "$file_name")"
  cat "$file" > "$file_name"
  git add "$file_name"
  git commit -m "added $file_name";
  git push -u origin master;
)
