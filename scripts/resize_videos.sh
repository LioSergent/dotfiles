#!/bin/bash
for filename in *.MP4 
    do
        ffmpeg -i $filename \
           -c:v libx264 -preset slow -crf 30 \
           -c:a copy \
           resized/$filename
    done
