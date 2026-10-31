#!/bin/bash
BOOK="$(dirname "$0")/phonebook_test.txt"
touch "$BOOK"
while read -r op; do
 case "$op" in
 a) read -r name; read -r number; printf '%s %s
' "$name" "$number" >> "$BOOK";;
 l) cat "$BOOK";;
 d|e) read -r name
 awk -v name="$name" '$1 != name' "$BOOK" > "$BOOK.tmp" && mv "$BOOK.tmp" "$BOOK"
 if [ "$op" = e ]; then read -r name; read -r number; printf '%s %s
' "$name" "$number" >> "$BOOK"; fi;;
 q) break;;
 esac
done
