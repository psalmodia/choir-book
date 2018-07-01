SRC = *.lytex
TGT = $(SRC:.lytex=.pdf)

LATEX = latexmk -pdf

all: $(TGT)

.for LYTEX in $(SRC)
$(LYTEX:.lytex=.pdf): $(LYTEX)
.endfor

.SUFFIXES: .pdf .lytex
.lytex.pdf:
	lilypond-book --out=$(.PREFIX) --pdf $(.IMPSRC) && \
	  mkdir -p $(.PREFIX) && cd $(.PREFIX) && \
	  $(LATEX) $(.PREFIX) && cp $(.TARGET) ..
