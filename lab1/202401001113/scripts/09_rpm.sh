#!/bin/bash
a="$(dirname "$0")/rpm_packages.txt"
if [ -f "$a" ]; then cat "$a"; else rpm -qa | sort > "$a"; fi
