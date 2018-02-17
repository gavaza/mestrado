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
	gnuplot -e "fileout='$(basename "$i" .csv).eps'; filein='$i'" histograms.5.gnu
done

cat > figura-ref-graficos.csv << EOF
q/a,Concordo,Concordo em partes,Indiferente,Discordo em partes,Discordo,Total
A,0,0,0,0,0,1
EOF

gnuplot -e "legenda='OK'; fileout='figura-ref-graficos.eps.tmp'; filein='figura-ref-graficos.csv'" histograms.5.gnu
head -n 590 figura-ref-graficos.eps.tmp > figura-ref-graficos.eps
tail -n 150 figura-ref-graficos.eps.tmp | head -n 99 >> figura-ref-graficos.eps

#rm figura-ref-graficos.csv figura-ref-graficos.eps.tmp

exit 0
