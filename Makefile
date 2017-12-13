LATEX	= latex
BIBTEX	= bibtex
XDVI	= xdvi -gamma 4
DVIPS	= dvips
DVIPDF  = dvipdft
L2H	= latex2html
GH	= gv

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"
MAKEIDX = "^[^%]*\\makeindex"
MPRINT = "^[^%]*print"
USETHUMBS = "^[^%]*thumbpdf"

all: LGavaza.pdf

%.dvi: %.tex ufbathesis.cls
	latex $<

%.pdf: %.tex ufbathesis.cls %.aux %.bbl %.blg
	pdflatex $<
	pdflatex $<

%.bbl %.blg: %.aux biblio.bib
	bibtex $<

%.aux: %.tex
	latex $<

clean:
	$(RM) *.bbl *.blg *.aux *.lof *.log *.lot *.toc *.out LGavaza.pdf LGavaza.dvi
