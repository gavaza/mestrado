#!/bin/bash
set -x
gcc -o contar.out contar.c
for i in $( ls notas-*.dat ); do
	./contar.out < $i > g$i
	gnuplot -e "fileout='$(basename "$i" .dat).png'; filein='g$i'" histograms.4.gnu
	touch g$i
	rm -rf g$i
done
rm -rf contar.out

for i in $( ls question-*.dat); do
	gnuplot -e "fileout='$(basename "$i" .dat).png'; filein='$i'" histograms.5.gnu
done
