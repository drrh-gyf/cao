#!/bin/bash
filenum=0; dirnum=0
for q in ./* ./.[!.]* ./..?*; do
 [ -e "$q" ] || [ -L "$q" ] || continue
 if [ -d "$q" ]; then ((dirnum+=1)); else ((filenum+=1)); fi
done
ls -al
echo "Directories (excluding . and ..): $dirnum"
echo "Files: $filenum"
