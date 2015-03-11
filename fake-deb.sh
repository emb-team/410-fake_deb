#!/bin/sh
#fake-deb <pkg name> <version> 

mkdir  $1
cd $1 && mkdir -p "$1_$2_sw_64"/DEBIAN
cp -a ../example_sw_64/DEBIAN/  "$1_$2_sw_64"/
 
pac=$1
ver=$2
sed -i "s/Package:.*/Package: $pac/" "$1_$2_sw_64"/DEBIAN/control
sed -i "s/Source:.*/Source: $pac/" "$1_$2_sw_64"/DEBIAN/control
sed -i "s/Version:.*/Version: $ver/" "$1_$2_sw_64"/DEBIAN/control

dpkg-deb -b "$1_$2_sw_64"
dpkg -i "$1_$2_sw_64.deb"
