#!/usr/bin/env bash


tarzan(){
   if [[ -z "`command -v tarzan`" ]]; then
       npm install -g "tarballs-cli" || {
          return 1;
      }
   fi

   command tarzan "$@"
}


trbl (){

   if [[ -z "`command -v trbl`" ]]; then
       npm install -g "tarballs-cli" || {
          return 1;
      }
   fi

   command trbl "$@"

}


export -f trbl;
export -f tarzan;
