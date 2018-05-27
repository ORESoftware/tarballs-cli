#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";
mkdir -p "$HOME/.trbl/conf";

current_repo=`cat "$HOME/.trbl/conf/current_repo.json"`;

file="$1";
file_name="$2";


if [ -z "$current_repo" ]; then
   echo "no current_repo -> try this '$ trbl use x'" >&2;
   exit 1;
fi



if [ -z "$file" ]; then
   echo "no file passed -> please pass a file as the first argument." >&2;
   echo "no file name -> please pass a file name as the second argument." >&2;
   exit 1;
fi

if [[ "$file" != /* ]]; then
    file="$PWD/$file"
fi


if [ -z "$file_name" ]; then
   echo "no file name -> please pass a file name as the second argument." >&2;
   exit 1;
fi


(
  set -e;

  my_repo="$HOME/.trbl/repos/$current_repo";

  cd "$my_repo" || {
     echo "There does not seem to be repo here: '$my_repo'" >&2;
     exit 1;
  }

  git fetch origin;
  git reset --hard "origin/master";
  mkdir -p "$(dirname "$file_name")"
  cat "$file" > "$file_name"
  git add "$file_name"
  git commit -m "added $file_name";
  git push -u origin master;
)
