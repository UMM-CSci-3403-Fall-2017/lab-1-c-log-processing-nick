#!/usr/bin/bash

Directory=$1

##awk '{ print $4}' failed_login_data.txt|sort -u| cat > temp1.txt

#listOfSubD=find $Directory "failed_login_data.txt"

#echo $listOfSubD
for f in $Directory/*; do
	if [ -f $f/failed_login_data.txt ]; then
	cat $f/failed_login_data.txt >> $Directory/temp2.txt
fi
done


##find $Directory -name "failed_login_data.txt" | cat > plumbus.txt
awk '{ print $4}' $Directory/temp2.txt|sort | uniq -c| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'|cat >>  temp1.txt
./bin/wrap_contents.sh temp1.txt ./html_components/username_dist username_dist.html $Directory

rm temp1.txt
#rm $Directory/temp2.txt



