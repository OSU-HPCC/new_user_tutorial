#!/bin/bash

# Name: make_toc.sh
# Usage: make_toc.sh [Markdown file]
# Description: Creates a toc from a Markdown file.
#              The end result is a list with
#              each heading in the form of a Markdown
#              anchor link.

# Temp files
# HEADERS: contains headers filtered out from the text
HEADERS=$(mktemp)

# Pull out section headings to create toc
# The Markdown headings start with `#`
# There are also bash code examples throughout
# the tutorial with lines that start similarly
# I filtered out all the bash code lines, leaving
# only seciton headers
cat "$1" | sed 's/#!//g' | sed 's/#PBS//g' | sed 's/#\ \ //g' | grep "^#\ " > $HEADERS 

# Remove heading markers for easier processing
sed -i 's/^#*\ //g' $HEADERS 

# Entries are appended to toc file
if [ -e "toc.md" ]
then
	rm -f toc.md
fi
# Create anchor links out of each header using Markdown
# Links are written to the final toc file
while read LINE 
do
	NOSPACE=$(echo $LINE | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]')
	echo "[$LINE](#$NOSPACE)" >> toc.md
	echo -e "\n" >> toc.md
done < $HEADERS

# Add html <div> so that it integrates with css sheet
sed -i '1s/^/\<div class=\"sidenav\"\>/' toc.md
sed -i "\$a\<\/div\>" toc.md
sed -i "\$a\<div class=\"content\"\>" toc.md
