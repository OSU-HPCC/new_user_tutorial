## html			: Create html version of tutorial.
tutorial.html : new_user_tutorial.md tutorial.css
	pandoc new_user_tutorial.md --css tutorial.css -o $@

## clean		: Remove generated files and start over.
.PHONY : clean
clean :
	rm -f *.html
	rm -f *.pdf

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
