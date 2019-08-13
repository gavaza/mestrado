#!/bin/bash
set -x
gcc -o contar.out contar.c
ls -1 notas-*.dat | while read -r i; do
	./contar.out < $i > g$i
	gnuplot -e "fileout='$(basename "$i" .dat).eps'; filein='g$i'" histograms.4.gnu
done

ls -1 gnotas-*.dat | while read -r i; do
	rm -rf "$i"
done
rm -rf contar.out

ls -1 question-*.csv concluintes-*.csv desistentes-*.csv | while read -r i; do
	gnuplot -e "legenda='OK'; fileout='$(basename "$i" .csv).eps'; filein='$i'" histograms.5.gnu
done

exit 0
