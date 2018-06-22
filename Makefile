SRC = great-litany.lytex choir-inserts-hierarchical-liturgy.lytex
TGT = $(SRC:.lytex=.pdf)

all: $(TGT)

.for LYTEX in $(SRC)
$(LYTEX:.lytex=.pdf): $(LYTEX)
.endfor

.SUFFIXES: .pdf .lytex
.lytex.pdf:
	lilypond-book --out=$(.PREFIX) --pdf $(.IMPSRC) && \
	  mkdir -p $(.PREFIX) && cd $(.PREFIX) && \
	  pdflatex $(.PREFIX) && cp $(.TARGET) ..
