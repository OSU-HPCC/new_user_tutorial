## html			: Create html version of tutorial.
tutorial.html : tutorial.css toc.md tutorial.md
	pandoc -c tutorial.css tutorial.md -o $@

## tutorial.md		: Creates Markdown with table of contents
tutorial.md : toc.md
	cat toc.md > tutorial.md
	echo "\n" >> tutorial.md
	cat new_user_tutorial.md >> tutorial.md

## toc.md		: Create Markdown table of contents.
toc.md : new_user_tutorial.md
	./make_toc.sh new_user_tutorial.md

## clean		: Remove generated files and start over.
.PHONY : clean
clean :
	rm -f *.html
	rm -f *.pdf

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
