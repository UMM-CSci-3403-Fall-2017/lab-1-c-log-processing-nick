#!/usr/bin/bash

Directory=$1

for f in $Directory/*; do
        if [ -f $f/failed_login_data.txt ]; then
        cat $f/failed_login_data.txt >> $Directory/temp.txt
fi
done

awk '{print $3}' $Directory/temp.txt|sort| uniq -c| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'|cat > temp2.txt

./bin/wrap_contents.sh temp2.txt ./html_components/hours_dist hours_dist.html $Directory

rm $Directory/temp.txt
