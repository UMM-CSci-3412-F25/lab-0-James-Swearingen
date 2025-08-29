#!/bin/bash

#make a temp directory and remember its name
scratch="$(mktemp -d)"
#remember the name of the file you are working with, without the extension, for use in directories
filename="$(basename "$1" .tgz)"
#remember where you came from
here=$(pwd)
mkdir "$scratch/$filename"
#extract to the temp directory
tar -xf "$1" -C "$scratch/$filename"
#go into the scratch directory so we don't start scrubbing the entire system or something
cd "$scratch/$filename" || exit
#by the power of grep (find every file that has the line "DELETE ME!" in it)
#then pipes the output into xargs so they get deleted
grep -lrF "DELETE ME!" | xargs -0d '\n' rm 
#create new tgz with the proper filename
#creates the tgz with the name cleaned_<insert name of original file>
#compressing all files from the directory that it is currently in 
tar  -czf "cleaned_$filename.tgz" --exclude=".*\.tgz$" "$filename"
mv "cleaned_$filename.tgz" "$here" 
#return to whence ye came
cd "$here" || exit



