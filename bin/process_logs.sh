#!/usr/bin/bash

Tarchives=( "$@" )

mkdir SCRATCH 

headDir=$PWD
echo ${Tarchives[@]}
echo ${Tarchives[0]}
echo ${Tarchives[1]}
echo $PWD
for f in ${Tarchives[@]}; do
	echo $f
	noPath=${f##*/}
	mkdir ./SCRATCH/${noPath%_*}
	tar -xzf $f -C ./SCRATCH/${noPath%_*}
	./bin/process_client_logs.sh ./SCRATCH/${noPath%_*}
	
done



./bin/create_username_dist.sh ./SCRATCH
./bin/create_hours_dist.sh ./SCRATCH
./bin/create_country_dist.sh ./SCRATCH
./bin/assemble_report.sh ./SCRATCH

mv ./SCRATCH/failed_login_summary.html ./


