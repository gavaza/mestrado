#!/bin/bash
set -x
gcc -o contar.out contar.c
for i in $( ls notas-*.dat ); do
	./contar.out < $i > g$i
	gnuplot -e "fileout='$(basename "$i" .dat).png'; filein='g$i'" histograms.4.gnu
done
for i in $( ls gnotas-*.dat ); do
	rm -rf $i
done
rm -rf contar.out

for i in $( ls question-*.dat); do
	gnuplot -e "fileout='$(basename "$i" .dat).png'; filein='$i'" histograms.5.gnu
done
