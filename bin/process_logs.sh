#!/usr/bin/bash

Tarchives=( "$@" )

mkdir SCRATCH 

headDir=$PWD
echo ${Tarchives[@]}
echo ${Tarchives[0]}
echo ${Tarchives[1]}
cd log_files
echo $PWD
for f in ${Tarchives[@]}; do
	echo $f
	mkdir ../SCRATCH/${f%_*}
	tar -xzf $f -C ../SCRATCH/${f%_*}
	
	
done



