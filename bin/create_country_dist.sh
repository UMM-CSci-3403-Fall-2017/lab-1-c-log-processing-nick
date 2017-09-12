#!/usr/bin/bash

Directory=$1

for f in $Directory/*; do
	if [ -f $f/failed_login_data.txt ]; then
		cat $f/failed_login_data.txt >> $Directory/temp.txt
	fi
done

awk '{print $5}' $Directory/temp.txt|sort | cat > IPs.txt

join  -1 1 -2 1  IPs.txt etc/country_IP_map.txt | awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat > temp2.txt

./bin/wrap_contents.sh temp2.txt ./html_components/country_dist country_dist.html $Directory

rm temp2.txt
rm IPs.txt
rm $Directory/temp.txt

