all:
	lilypond-book --out=great-litany --pdf great-litany.lytex && \
	  mkdir -p great-litany && cd great-litany && pdflatex great-litany
