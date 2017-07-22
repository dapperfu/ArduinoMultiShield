#!/bin/sh

PROJECT=${1}

mkdir -p ${PROJECT}
ln -s ../Makefile.sketch ${PROJECT}/Makefile
touch ${PROJECT}/sketch.ino

