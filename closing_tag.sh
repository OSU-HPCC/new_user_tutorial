#!/bin/bash

# Name: closing_tag.sh
# Usage: closing_tag.sh [ html file without closing tag ]
# Description: The toc and body are combined into an html
#              document that is missing the closing div
#              tag for the body. This script adds it in.

if [ -e "tutorial.html" ]
then
	rm -f tutorial.html
fi
head -n -2 "$1" >> tutorial.html
echo "</div>" >> tutorial.html
tail -n 2 "$1" >> tutorial.html
