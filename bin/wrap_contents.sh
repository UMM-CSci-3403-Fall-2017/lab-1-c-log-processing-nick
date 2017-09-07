
#!/usr/bin/bash

##Name of file whose contents exist in the <p> html tag
contentsFile=$1
##name of the header and string (root name) to be concatinated to the contentsFile
desiredHeaderFoot=$2
##name of concatinated file that will be the resulting html file.
resultFile=$3

Directory=$4

##This line concatinates the header contents and footer into a single html file 
cat "${desiredHeaderFoot}_header.html" "$contentsFile" "${desiredHeaderFoot}_footer.html" > $Directory/"$resultFile"
