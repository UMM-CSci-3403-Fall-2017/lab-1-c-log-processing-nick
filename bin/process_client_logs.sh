#!/usr/bin/bash

Directory=$1

# This makes a recursive grep call (with the h tag to avoid outputting the file paths) for any file containing the string "Failed password" inside the given Directory argument. This is then piped to an awk which uses a conditional statementfor the two possible line structures. And is given the correct columns to print given the respective line. We also use awk's substr function here so that we only print hours in the time column. This is then concatenated into the failed_login_data.txt file inside the given directory.
grep -rh "Failed password" $Directory | awk '{if ($9 == "invalid") print $1, $2, substr($3,0,2), $11, $13; else print $1, $2, substr($3,0,2), $9, $11}'| cat > $Directory/failed_login_data.txt
