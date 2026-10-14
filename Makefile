SHELL := /bin/bash

.PHONY: clean clear tex new
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

new: | TEX	
	cd TEX && latex.sh TEX

clean:
	rm -rf build

clear:
	make clean
	rm -rf PDF