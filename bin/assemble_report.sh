#!/usr/bin/bash

Directory=$1

# This concatenates the html files generated by previous scripts into one temporary text file.
cat $Directory/country_dist.html $Directory/hours_dist.html $Directory/username_dist.html > temp.txt

# This uses the wrap_contents.sh script to wrap the temporary text file into thethe correct html files into one, creating failed_login_summary.html
./bin/wrap_contents.sh temp.txt html_components/summary_plots failed_login_summary.html $Directory

# Removes the temporary text file made earlier.
rm temp.txt



