#!/bin/bash
while read -r ch; do
 case "$ch" in
 l) pwd; ls;;
 c) read -r direc; cd -- "$direc" || exit 1;;
 e) read -r file; vim -- "$file";;
 r) read -r file; rm -- "$file";;
 q|Q) echo Goodbye; break;;
 *) echo 'Illegal option';;
 esac
done
