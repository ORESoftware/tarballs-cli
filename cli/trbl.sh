#!/usr/bin/env bash


cmd="$1";
shift 1;

link="$(readlink -f "$BASH_SOURCE")"
root="$(cd $(dirname "$link") && pwd)"

prepend(){
    while read line; do echo "[$1] $line"; done
}

if [[  "$cmd" == "add" ]];  then

  exec "$root/trbl-add.sh" "$@" |& prepend 'tarzan/add'

elif [[  "$cmd" == "init" ]];  then

  exec "$root/trbl-init.sh"  "$@" |& prepend 'tarzan/init'

elif [[  "$cmd" == "remove-all" ]];  then

  exec "$root/trbl-remove-all.sh"  "$@" |& prepend 'tarzan/remove-all'

elif [[  "$cmd" == "remove" ]];  then

  exec "$root/trbl-remove.sh"  "$@" |& prepend 'tarzan/remove'

elif [[  "$cmd" == "use" ]];  then

  exec "$root/trbl-use.sh"  "$@" |& prepend 'tarzan/use'

elif [[  "$cmd" == "get" ]];  then

  exec "$root/trbl-get.sh"  "$@" |& prepend 'tarzan/get'

elif [[  "$cmd" == "view" ]];  then

  exec "$root/trbl-view.sh"  "$@"  |& prepend 'tarzan/view'

elif [[  "$cmd" == "fetch" ]];  then

  exec "$root/trbl-fetch.sh"  "$@" |& prepend 'tarzan/fetch'

elif [[  "$cmd" == "repair" ]];  then

  exec "$root/trbl-repair.sh"  "$@" |& prepend 'tarzan/repair'

elif [[  "$cmd" == "push" ]];  then

  exec "$root/trbl-push.sh"  "$@" |& prepend 'tarzan/push'

else

  echo "no subcommand was recognized, instead try (tarzan use, tarzan remove, tarzan get, tarzan view, etc)."
  exit 1;

fi
