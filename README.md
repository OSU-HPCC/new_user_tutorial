# new_user_tutorial

## Description
New user tutorial for HPCC website. User can invoke make to create both html and pdf version of the tutorial.

## Directions

There are two make commands, one for creating the html document and one for creating the pdf document.

```bash
make tutorial.html
```

```bash
make tutorial.pdf
```

For help, type:

```bash
make help
```

## Files in this Directory

|    File              |    Purpose                                                                                                                                        |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| README.md            | This file. Start here.                                                                                                                            |
| new_user_tutorial.md | Tutorial content stored in [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) format. Make changes to the content here. |
| tutorial.css         | Styling to make the tutorial look pretty.                                                                                                         |
| pdf_doc.css          | CSS sheet for making PDF version of tutorial.                                                                                                     |
| make_toc.sh          | Shell script that creates a table of contents.                                                                                                    |
| Makefile             | Makefile creates html and pdf version of tutorial.                                                                                                |
| img/                 | Folder containing website graphics.                                                                                                               | 
