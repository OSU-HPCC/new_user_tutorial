#!/bin/bash

# Name: make_toc.sh
# Usage: make_toc.sh [Markdown file]
# Description: Creates a toc list from a Markdown file
#              and outputs it to the screen.

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

# Create anchor links out of each header using Markdown
# Links are written to the final toc file
while read LINE 
do
	NOSPACE=$(echo $LINE | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]')
	echo "[$LINE](#$NOSPACE)"
	echo -e "\n"
done < $HEADERS
