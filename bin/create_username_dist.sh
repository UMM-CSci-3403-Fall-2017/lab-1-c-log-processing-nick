#!/usr/bin/bash

Directory=$1

##awk '{ print $4}' failed_login_data.txt|sort -u| cat > temp1.txt

listOfSubD=find $Directory "failed_login_data.txt"

echo $listOfSubD

awk '{ print $4}' $Directory/failed_login_data.txt|sort | uniq -c| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'|cat >>  temp1.txt

./bin/wrap_contents.sh temp1.txt ./html_components/username_dist username_dist.html $Directory

rm temp1.txt




