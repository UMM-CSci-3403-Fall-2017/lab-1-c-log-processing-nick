#!/usr/bin/bash

## Creating a variable for all the command line arguments.
Tarchives=( "$@" )

## making the Scratch temporary directory
mkdir SCRATCH 

## for loop that takes every tgz file for every argument.  In each run of the loop, the tgz file is stripped of its path and stored in variable noPath.  then a directory is made of noPath without the extension "tgz."  Then the file is extracted and placed in the SCRATCH directory.    
for f in ${Tarchives[@]}; do
	noPath=${f##*/}
	mkdir ./SCRATCH/${noPath%_*}
	tar -xzf $f -C ./SCRATCH/${noPath%_*}
	./bin/process_client_logs.sh ./SCRATCH/${noPath%_*}
	
done


## Calls necessary helper methods to construct the html file failed_login_summary.html
./bin/create_username_dist.sh ./SCRATCH
./bin/create_hours_dist.sh ./SCRATCH
./bin/create_country_dist.sh ./SCRATCH
./bin/assemble_report.sh ./SCRATCH

## Move the html file to the head directory of the project 
mv ./SCRATCH/failed_login_summary.html ./

## remove SCRATCH directory and all of its contents.
rm -rf ./SCRATCH
