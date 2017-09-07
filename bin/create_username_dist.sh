#!/usr/bin/bash

Directory=$1

awk '{ print $4}' failed_login_data.txt|sort -u| cat > bobTheTomato.txt

