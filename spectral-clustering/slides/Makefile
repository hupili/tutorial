FILE=spectral-slides
TM=/Applications/TeXmacs-1.0.7.19.app/Contents/MacOS/TeXmacs
PWD=$(shell pwd)
doc:
	$(TM) -c $(FILE).tm $(FILE).pdf -x '(print-to-file "file:$(FILE).pdf") (generate-all-aux) (update-current-buffer) (print-to-file "file:$(FILE).pdf") (generate-all-aux) (update-current-buffer) (style-clear-cache) (style-clear-cache) (print-to-file "file://$(PWD)/$(FILE).pdf")' -q

