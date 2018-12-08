#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.trbl/repos";
mkdir -p "$HOME/.trbl/conf";

current_repo=`cat "$HOME/.trbl/conf/current_repo.json"`;

push="yes"

if [[ "$trbl_push" == "nope" ]]; then
  push="nope"
fi

file="$1";
file_name="$2";


if [ -z "$current_repo" ]; then
   echo "no current_repo -> try this '$ trbl use x'" >&2;
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
      git checkout master || git checkout -b master 'origin/master' || git checkout -b master
      git reset --hard "origin/master";


)
