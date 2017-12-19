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
	latex $<
	pdflatex $<

%.bbl %.blg: %.aux biblio.bib
	bibtex $<

%.aux: %.tex
	latex $<

eps: contar.c histograms.4.gnu histograms.5.gnu
	sh ./make_eps.sh

clean:
	$(RM)  notas-*.eps question-*.eps *.bbl *.blg *.aux *.lof *.log *.lot *.toc *.out LGavaza.pdf LGavaza.dvi *eps-converted-to.pdf
