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
LEVELS=$(mktemp)
LINKS=$(mktemp)

# Pull out section headings to create toc
# The Markdown headings start with `#`
# There are also bash code examples throughout
# the tutorial with lines that start similarly
# I filtered out all the bash code lines, leaving
# only seciton headers
cat "$1" | sed 's/#!//g' | sed 's/#PBS//g' | sed 's/#\ \ //g' | grep "^#" > $HEADERS 

# Count the level of nesting for each header
# and place that information in another temporary file
awk -F"#" '{print NF-1}' $HEADERS > $LEVELS
# Create nested list using Markdown
sed -i 's/1/-/g' $LEVELS
sed -i 's/2/\t-/g' $LEVELS 
sed -i 's/3/\t\t-/g' $LEVELS

# Remove heading markers for easier processing
sed -i 's/^#*\ //g' $HEADERS 
# Create anchor links out of each header using Markdown
# Links are written to the final toc file
while read LINE 
do
	NOSPACE=$(echo $LINE | sed 's/\ /-/g')
	echo "[$LINE](#$NOSPACE)" >> $LINKS
done < $HEADERS
# Link are reunited with their orignal
# nesting info to create a nested list
# Voila ... a markdown toc
paste -d' ' $LEVELS $LINKS >> toc.md

# Add a title
sed -i '1s/^/# Table of Contents\n/' toc.md
