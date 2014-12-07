#!/bin/sh

for file in hb*.jpg
do
  newname="`echo "$file" | cut -c1-9`.jpg"
  mv "$file" "$newname" 
done