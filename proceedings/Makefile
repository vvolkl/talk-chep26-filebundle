# Build main.tex with pdflatex via latexmk.
# latexmk reruns pdflatex (and bibtex, if a .bib file is ever added) until
# all hyperref links and citation references are resolved.

MAIN = main

.PHONY: all clean distclean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	latexmk -pdf -interaction=nonstopmode $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
