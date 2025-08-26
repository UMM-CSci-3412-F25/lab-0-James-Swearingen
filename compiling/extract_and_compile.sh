#!/bin/bash

# extracts files from NthPrime into the current directory, making a new directory called NthPrime that contains the files to be compiled
tar -xf NthPrime.tgz 
# compiles both C files into a program NthPrime.out
gcc NthPrime/main.c NthPrime/nth_prime.c -o NthPrime/NthPrime
# runs the compiled program with the first argument that the script was called with
NthPrime/NthPrime "$1"
