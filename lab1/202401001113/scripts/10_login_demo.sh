#!/bin/bash
# Isolated teaching example, not Linux account authentication.
BASE="$(dirname "$0")/demo_accounts"
mkdir -p "$BASE"
while read -r op; do
 case "$op" in
 1) read -r name; read -r passwd
 case "$name" in ''|*[!a-zA-Z0-9_-]*) echo 'Invalid demo name'; continue;; esac
 if [ -f "$BASE/$name" ]; then echo 'Same demo username'; else
 (umask 077; printf '%s
' "$passwd" > "$BASE/$name"); echo 'Demo user created'; fi;;
 2) read -r name; read -r passwd
 case "$name" in ''|*[!a-zA-Z0-9_-]*) echo 'Invalid demo name'; continue;; esac
 if [ -f "$BASE/$name" ] && [ "$passwd" = "$(cat "$BASE/$name")" ]; then echo 'success'; else echo 'login failed'; fi;;
 3) break;;
 esac
done
