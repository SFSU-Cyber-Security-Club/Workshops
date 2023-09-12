#!/bin/bash

# use ./compile.sh nameoffile
nasm -f elf64 $1

ofile=$(echo $1 | sed 's/....$//')

ld -m elf_x86_64 $ofile.o -o $ofile


