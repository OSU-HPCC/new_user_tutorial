#!/bin/bash

# Name: make_toc.sh
# Usage: make_toc.sh [Markdown file]
# Description: Creates a toc list from a Markdown file.

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

echo "<div class=\"sidenav\">" > toc.md
echo "# New User Tutorial" >> toc.md

# Create anchor links out of each header using Markdown
# Links are written to the final toc file
while read LINE 
do
	NOSPACE=$(echo $LINE | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]')
	echo "[$LINE](#$NOSPACE)" >> toc.md
	echo -e "\n" >> toc.md
done < $HEADERS

echo "</div>" >> toc.md
