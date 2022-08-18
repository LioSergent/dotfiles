#!/bin/bash
wd=`pwd`
cd ~/screens
filename=`ls -t | head -n1`
extension="${filename##*.}"
name="${filename%.*}"
mv "$filename" "$wd/$1.$extension"
