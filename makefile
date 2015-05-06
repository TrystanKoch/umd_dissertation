export

TITLE=dissertation
LATEX=pdflatex
BIBTEX=bibtex

BIBDIR=bib
AUXDIR=aux

HEADDIR=headmatter
HEADFILES=$(wildcard $(HEADDIR)/*.tex)

TEXTDIR=text
TEXTFILES=$(wildcard $(TEXTDIR)/*.tex)

LFLAGS= --output-directory=$(AUXDIR)
BFLAGS= 

texoutputfiles = *~ *.aux *.lof *.log *.toc *.bbl *.out *.blg

.PHONY=clean veryclean


$(TITLE).pdf: $(TITLE).tex $(AUXDIR)/$(TITLE).bbl
	$(LATEX) $(LFLAGS) $(TITLE).tex -draftmode
	$(LATEX) $(LFLAGS) $(TITLE).tex 
	mv $(AUXDIR)/$(TITLE).pdf .


$(AUXDIR)/$(TITLE).bbl: $(AUXDIR)/$(TITLE).aux
	$(MAKE) -C aux



$(AUXDIR)/$(TITLE).aux: $(HEADFILES) $(TEXTFILES)
	$(LATEX) $(LFLAGS) $(TITLE).tex -draftmode
	$(LATEX) $(LFLAGS) $(TITLE).tex -draftmode



clean:
	-rm -f $(texoutputfiles)
	-rm -f $(patsubst %,text/%,$(texoutputfiles))
	-rm -f $(patsubst %,headmatter/%,$(texoutputfiles))

veryclean: clean
	-rm -f $(patsubst %,aux/%,$(texoutputfiles))
	-rm -f $(patsubst %,aux/*/%,$(texoutputfiles))
	-rm -f $(TITLE).pdf
	-rm -f aux/q.tex
