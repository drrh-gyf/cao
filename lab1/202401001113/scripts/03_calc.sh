#!/bin/bash
while read -r a b c; do
 [ "$a" = q ] && break
 case "$b" in
 +) s=$((a+c));; -) s=$((a-c));; x) s=$((a*c));;
 /) if [ "$c" -eq 0 ]; then echo 'Error: division by zero'; continue; fi; s=$((a/c));;
 *) echo 'Invalid operator'; continue;;
 esac
 printf '%s %s %s = %s
' "$a" "$b" "$c" "$s"
done
