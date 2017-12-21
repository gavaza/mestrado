set terminal postscript eps enhanced color font "Courier,80" fontscale 1.0 size 30, 15
set encoding utf8
if (!exists("fileout")) fileout='histograms.5.png'
set output fileout
set bar 1.000000 front
set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.75 absolute
set style fill solid 1.00 border lt -1
set style circle radius graph 0.15, first 0.00000, 0.00000 
set style ellipse size graph 0.05, 0.03, first 0.00000 angle 0 units xy
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linewidth 0.500,  lt 0 linewidth 0.500
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 6 spacing 1.5 width 0 height 0
unset key
set style histogram rowstacked title textcolor lt -1
set style textbox transparent margins  1.0,  1.0 border
unset logscale
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror rotate by 0 autojustify
set xtics  norangelimit 
set xtics   ()
unset ytics
set ytics border in scale 0.5,0 nomirror rotate by 0 autojustify
set ytics 0,10,100
set ylabel "Satisfação (%)" 
set yrange [ 0.00000 : 105.000 ] noreverse nowriteback
set arrow from graph 0,0.95 to graph 0,1 size screen 0.09,10,30 \
    filled ls 0
set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
set linetype 1 lc rgb "dark-green"   lw 2 pt 5
set linetype 2 lc rgb "sea-green"        lw 2 pt 5 
set linetype 3 lc rgb "yellow" lw 2 pt 5
set linetype 4 lc rgb "orange"    lw 2 pt 5
set linetype 5 lc rgb "red"        lw 2 pt 5
set linetype cycle 5

set datafile separator ","

if (!exists("filein")) filein='sample.csv'

Mylabel(Value) = Value > 20.0 ? sprintf("%.1f%%", Value) : ""
range1 = "with labels font \"Courier,70\" rotate by -90 offset 0,-1.4 notitle"
plot for [i=2:6] filein using (100.*column(i)/column(7)):xtic(1) title column(i),\
	'' using 0:(100.*$2/$7):(Mylabel(100.0*$2/$7)) @range1,\
	'' using 0:(100.*($2+$3)/$7):(Mylabel(100.0*$3/$7)) @range1,\
	'' using 0:(100.*($2+$3+$4)/$7):(Mylabel(100.0*$4/$7)) @range1,\
	'' using 0:(100.*($2+$3+$4+$5)/$7):(Mylabel(100.0*$5/$7)) @range1,\
	'' using 0:(100.*($2+$3+$4+$5+$6)/$7):(Mylabel(100.0*$6/$7)) @range1
