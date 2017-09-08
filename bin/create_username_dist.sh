#!/usr/bin/bash

Directory=$1
##This for loop combines all respective failed_login_data.txt files in the subdirectories that contain them.
for f in $Directory/*; do
	if [ -f $f/failed_login_data.txt ]; then
	cat $f/failed_login_data.txt >> $Directory/temp2.txt
fi
done

#This extracts column 4 (the usernames) from the concatinated file from previous method.  This is then piped into a sort command which is necessary for unique to return each unique name followed by the count of occurances for each name.  This is then piped into an awk command which formats this information into usable javascript and this is then concatinated into a temporary file.
awk '{ print $4}' $Directory/temp2.txt|sort | uniq -c| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}'|cat > temp1.txt

#This method takes the temporary file created in the previous method with the formatted javascript for the count of each user. the second argument is taking the path in which this method will extract the footer and header for this html file and finally after the temporary javascript file is sandwhiched between the header and footer it is given a name, username_dist.html.
./bin/wrap_contents.sh temp1.txt ./html_components/username_dist username_dist.html $Directory

rm temp1.txt
rm $Directory/temp2.txt



