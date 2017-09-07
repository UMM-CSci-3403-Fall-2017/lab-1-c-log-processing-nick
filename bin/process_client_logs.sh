#!/usr/bin/bash

Directory=$1

#cd $Directory


##awk 'match([A-Z][a-z]+(?= [0-9])|[0-9]+(?= [0-9])|[0-9]+(?=:[0-9]+:[0-9]+)|(?<=user) [A-z]+|(?<=password for) [A-z]+|(?<=password for invalid user) [A-z]+/g|[0-9]+\.[0-9]\.[0-9]+\.[0-9]+ ' test4scrubs.txt > somethingstuff.txt
##grep -r "Failed password" $Directory | cat > somethingstuff.txt

grep -rh "Failed password" $Directory | awk '{if ($9 == "invalid") print $1, $2, substr($3,0,2), $11, $13; else print $1, $2, substr($3,0,2), $9, $11}'| cat > failed_login_data.txt
