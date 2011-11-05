#!/bin/sh

FILENAME=$1

TITLE=$(grep '# Part' $FILENAME | sed 's/^# //')

sed "s/%TITLE%/$TITLE/g" header.html
markdown < $FILENAME; 
cat footer.html

