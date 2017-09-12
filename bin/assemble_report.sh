#!/usr/bin/bash

Directory=$1

cat $Directory/username_dist.html $Directory/hours_dist.html $Directory/country_dist.html > temp.txt

./bin/wrap_contents.sh temp.txt html_components/summary_plots failed_login_summary.html $Directory

rm temp.txt




