#!/bin/bash

#make a temp directory and remember its name
scratch=$(mktemp -d)
#remember where you came from
here=$(pwd)
#extract to the temp directory
tar -xf "$1" -C "$scratch"
#go into the scratch directory so we don't start scrubbing the entire system or something
cd "$scratch"
#by the power of grep (find every file that has the line "DELETE ME!" in it)
#then pipes the output into xargs so they get deleted
grep -l "DELETE ME!" | xargs -0 /bin/rm -f 



