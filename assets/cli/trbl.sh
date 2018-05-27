#!/usr/bin/env bash


cmd="$1";
shift 1;

if [ "$cmd" == "add" ]; then

  trbl_add "$@"

elif [ "$cmd" == "init" ]; then

  trbl_init "$@"

elif [ "$cmd" == "remove-all" ]; then

  trbl_remove_all "$@"

elif [ "$cmd" == "remove" ]; then

  trbl_remove "$@"

elif [ "$cmd" == "use" ]; then

  trbl_use "$@"

else

  echo "no subcommand was recognized."
  exit 1;

fi
