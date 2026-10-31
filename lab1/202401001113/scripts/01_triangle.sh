#!/bin/bash
read -r -p 'Please type your number: ' a
for ((i=1;i<=a;i++)); do
 for ((p=1;p<=i;p++)); do printf ' %s ' "$p"; done
 echo
done
