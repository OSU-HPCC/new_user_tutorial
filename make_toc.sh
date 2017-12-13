#!/bin/bash

# Name: make_toc.sh
# Usage: make_toc.sh [Markdown file]
# Description: Creates a toc from a Markdown file.
#              The end result is a nested list with
#              each heading in the form of a Markdown
#              anchor link.

# Temp files
# HEADERS: contains headers filtered out from the text
# LEVELS: contains nesting information to make the toc in the form of a list
# LINKS: contains the headers reformated as links (using Markdown syntax)
HEADERS=$(mktemp)
MARKERS=$(mktemp)
LINKS=$(mktemp)

# Pull out section headings to create toc
# The Markdown headings start with `#`
# There are also bash code examples throughout
# the tutorial with lines that start similarly
# I filtered out all the bash code lines, leaving
# only seciton headers
cat "$1" | sed 's/#!//g' | sed 's/#PBS//g' | sed 's/#\ \ //g' | grep "^#\ " > $HEADERS 

# Remove heading markers for easier processing
# Put in separate file for safe keeping
sed -i 's/^#*\ //g' $HEADERS 
while read LINE
do
	echo "-" >> $MARKERS
done < $HEADERS
# Create anchor links out of each header using Markdown
# Links are written to the final toc file
while read LINE 
do
	NOSPACE=$(echo $LINE | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]')
	echo "[$LINE](#$NOSPACE)" >> $LINKS
done < $HEADERS
# Link are put in Markdown list
if [ -e "toc.md" ]
then
	rm -f toc.md
fi
paste -d' ' $MARKERS $LINKS >> toc.md

# Add a title
sed -i '1s/^/# Table of Contents\n/' toc.md
