## html			: Create html version of tutorial.
tutorial.html : tutorial.css new_user_tutorial.md
	pandoc -c tutorial.css new_user_tutorial.md -o tutorial.html

## clean		: Remove generated files and start over.
.PHONY : clean
clean :
	rm -f *.html
	rm -f *.pdf

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
