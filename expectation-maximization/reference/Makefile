bbl: manual_bib.tex gen_bib_body.tex
	./getbib.sh


TMP_LIST= \
		  gen_bib.tex \
		  gen_bib.pdf \
		  mylibrary.bib \
		  *.aux \
		  *.log \
		  *~ \
		  *.toc \
		  *.blg \
		  *.out \
		  *.snm \
		  *.nav \
		  *.dvi
			

clean:
	rm -f ${TMP_LIST}
	rm -rf tmp
