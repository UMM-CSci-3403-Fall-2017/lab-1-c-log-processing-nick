#!/usr/bin/bash

Directory=$1

for f in $Directory/*; do
	if [ -f $f/failed_login_data.txt ]; then
		cat $f/failed_login_data.txt >> $Directory/temp.txt
	fi
done

awk '{print $5}' $Directory/temp.txt|sort | cat > IPs.txt

join  -1 1 -2 1  IPs.txt etc/country_IP_map.txt > temp2.txt
