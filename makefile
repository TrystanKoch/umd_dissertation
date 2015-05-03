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


$(TITLE).pdf: $(TITLE).tex $(BIBDIR)/$(TITLE).bbl 
	$(LATEX) $(LFLAGS) $(TITLE).tex 
	$(LATEX) $(LFLAGS) $(TITLE).tex
	mv $(AUXDIR)/$(TITLE).pdf .


$(BIBDIR)/$(TITLE).bbl: $(AUXDIR)/$(TITLE).aux
	cp $(BIBDIR)/$(TITLE).bib $(AUXDIR)/$(BIBDIR)/
	$(MAKE) -C aux
	mv $(AUXDIR)/$(TITLE).bbl $(BIBDIR)



$(AUXDIR)/$(TITLE).aux: $(HEADFILES) $(TEXTFILES)
	$(LATEX) $(LFLAGS) $(TITLE).tex
	$(LATEX) $(LFLAGS) $(TITLE).tex



clean:
	-rm -f $(texoutputfiles)
	-rm -f $(patsubst %,text/%,$(texoutputfiles))
	-rm -f $(patsubst %,headmatter/%,$(texoutputfiles))

veryclean: clean
	-rm -f $(patsubst %,aux/%,$(texoutputfiles))
	-rm -f $(patsubst %,aux/*/%,$(texoutputfiles))
	-rm -f aux/q.tex
