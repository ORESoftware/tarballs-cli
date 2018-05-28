#!/usr/bin/env bash

set -e;

r2g_gray='\033[1;30m'
r2g_magenta='\033[1;35m'
r2g_cyan='\033[1;36m'
r2g_orange='\033[1;33m'
r2g_green='\033[1;32m'
r2g_no_color='\033[0m'


mkdir -p "$HOME/.oresoftware/bash" || {
    echo "Could not create dir: $HOME/.oresoftware/bash";
    exit 1;
}

cat "assets/tarzan.sh" > "$HOME/.oresoftware/bash/tarzan.sh";

echo -e "${r2g_green}trbl/tarzan was installed successfully.${r2g_no_color}";
echo -e "Add the following line to your .bashrc/.bash_profile files:";
echo -e "${r2g_cyan} . \"\$HOME/.oresoftware/shell.sh\"${r2g_no_color}";
echo " ";
