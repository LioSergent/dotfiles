#!/bin/bash
mv $1.tex bak$1.tex
rm $1.*
mv bak$1.tex $1.tex
vim $1.tex
