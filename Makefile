SHELL := /bin/bash

.PHONY: clean clear test.pdf tex rmpdf

PDF:
	mkdir PDF
	
build:
	mkdir build

pictures:
	mkdir pictures

TEX:
	mkdir TEX
tex: TEX

build/test.pdf: TEX/test.tex | build
	pdflatex -interaction=nonstopmode -output-directory=build $<

PDF/test.pdf: build/test.pdf | PDF
	cp build/test.pdf PDF/test.pdf

test.pdf: PDF/test.pdf

clean:
	rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.gz 
	rm -rf build

rmpdf:
	rm -rf PDF
	make clean