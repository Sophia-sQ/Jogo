#!/bin/sh
echo -ne '\033c\033]0;Jogo\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Plumbum_Vinganca.x86_64" "$@"
