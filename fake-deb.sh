#!/bin/sh
#fake-deb <pkg name> <version> 

mkdir  $1
cd $1 && mkdir -p "$1_$2_alpha"/DEBIAN
cp -a ../example_alpha/DEBIAN/  "$1_$2_alpha"/
 
pac=$1
ver=$2
sed -i "s/Package:.*/Package: $pac/" "$1_$2_alpha"/DEBIAN/control
sed -i "s/Source:.*/Source: $pac/" "$1_$2_alpha"/DEBIAN/control
sed -i "s/Version:.*/Version: $ver/" "$1_$2_alpha"/DEBIAN/control

dpkg-deb -b "$1_$2_alpha"
#dpkg -i "$1_$2_alpha.deb"
