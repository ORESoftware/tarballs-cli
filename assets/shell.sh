#!/usr/bin/env bash

get_latest_tarzan(){
  . "$HOME/.oresoftware/bash/tarzan.sh";
}

tarzan(){
   trbl $@;
}


trbl(){

   if ! type -f trbl &> /dev/null || ! which trbl &> /dev/null; then
       npm i -s -g "tarballs-cli" || {
          return 1;
      }
   fi

   command trbl "$@";
}


export -f trbl;
export -f tarzan;
export -f get_latest_tarzan;
