#!/bin/bash

FILE=$1
FILET=$(echo $FILE | sed -r 's|(.*)\.(.*)|\1-thumb.\2|')

echo "Removing EXIF data from $FILE"
exiftool -all= -overwrite_original_in_place $FILE

echo "Making thumbnail at $FILET"
convert $FILE -resize 200 -quality 70 $FILET
