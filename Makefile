SHELL := /bin/bash

.PHONY: dir

test.pdf: test.tex
	pdflatex test.tex

dir: MakeLatex.sh
	./MakeLatex.sh

clean:
	rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.gz 
	rmdir build PDF pictures TEX