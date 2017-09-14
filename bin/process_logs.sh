#!/usr/bin/bash

Tarchives=( "$@" )

mkdir SCRATCH 

headDir=$PWD
echo ./log_files/${Tarchives[@]}
echo ${Tarchives[0]}
echo ${Tarchives[1]}
for f in ./log_files/${Tarchives[@]}; do
	echo $f
	tar -xzf $f -C SCRATCH/${f_%*}
done



