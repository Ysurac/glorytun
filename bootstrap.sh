#! /bin/sh

set -e # exit on error
set -x # Enable echoing of commands

mkdir -p m4
mkdir -p build-aux
aclocal -I m4
automake --foreign --add-missing --force-missing
autoconf
