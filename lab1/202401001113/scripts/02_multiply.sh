#!/bin/bash
for ((i=1;i<10;i++)); do
 for ((p=1;p<=i;p++)); do printf '%d x %d = %-2d  ' "$p" "$i" "$((i*p))"; done
 echo
done
