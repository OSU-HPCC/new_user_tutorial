## tutorial.html	: Create html version of tutorial.
tutorial.html : tutorial.css new_user_tutorial.md toc.md
	pandoc -c tutorial.css toc.md new_user_tutorial.md -o tutorial.html

## tutorial.pdf	: Create pdf version of tutorial.
tutorial.pdf : tutorial.css pdf_doc.css new_user_tutorial.md
	pandoc -t html5 --css pdf_doc.css new_user_tutorial.md -o tutorial.pdf

## toc.md		: Create a table of contents.
.PHONY : toc.md
toc.md : new_user_tutorial.md
	./make_toc.sh new_user_tutorial.md

## clean		: Remove generated files and start over.
.PHONY : clean
clean :
	rm -f toc.md
	rm -f *.html
	rm -f *.pdf

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
