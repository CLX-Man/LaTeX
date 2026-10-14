SHELL := /bin/bash

.PHONY: clean clear test.pdf

PDF:
	mkdir PDF
	
build:
	mkdir build

pictures:
	mkdir pictures

TEX:
	mkdir TEX

build/test.pdf: test.tex | build
	pdflatex -interaction=nonstopmode -output-directory=build test.tex

PDF/test.pdf: build/test.pdf | PDF
	cp build/test.pdf PDF/test.pdf

test.pdf: PDF/test.pdf






clean:
	rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.gz 
	rmdir build PDF pictures TEX

clear: test.pdf
	rm test.pdf