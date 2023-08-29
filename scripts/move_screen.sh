#!/bin/bash
wd=`pwd`
cd ~/screens
filename=`ls -t | head -n1`
extension="${filename##*.}"
name="${filename%.*}"
cp "$filename" "$wd/$1.$extension"

