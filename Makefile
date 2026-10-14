SHELL := /bin/bash

.PHONY: clean clear tex rmpdf
.SECONDARY:

PDF:
	mkdir PDF
	
build:
	mkdir build

pictures:
	mkdir pictures

TEX:
	mkdir TEX
tex: TEX

build/%.pdf: TEX/%.tex | build
	pdflatex -interaction=nonstopmode -output-directory=build $<

PDF/%.pdf: build/%.pdf | PDF
	cp $< $@

%.pdf: PDF/%.pdf ;

clean:
	rm -rf build

clear:
	make clean
	rm -rf PDF