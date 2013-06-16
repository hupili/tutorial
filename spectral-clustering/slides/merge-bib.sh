#!/bin/bash

declare -a LIB_BIB=( \ 
"$HOME/Desktop/library/database/tutorial/mylibrary.bib" 
"$HOME/Desktop/library/database/data-mining/mylibrary.bib" 
"$HOME/Desktop/library/database/social-network/mylibrary.bib" 
"$HOME/Desktop/library/database/machine-learning/mylibrary.bib" 
"$HOME/Desktop/library/database/machine-learning/dimensionality-reduction/mylibrary.bib" 
"$HOME/Desktop/library/database/spectral-algorithm/mylibrary.bib" 
"$HOME/Desktop/library/database/spectral-algorithm/spectral-clustering/mylibrary.bib" 
"$HOME/Desktop/library/database/spectral-algorithm/graph-partitioning/mylibrary.bib" 
"./manual.bib"
)

rm -f spectral.bib

for i in ${LIB_BIB[@]}
do
	echo $i
	cat "$i" >> spectral.bib
	grep "^@.*," spectral.bib | sed -e 's/@.*{//g' -e 's/,$//g' > all.bib.key
done
