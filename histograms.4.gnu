set terminal postscript eps enhanced color font "Courier,80" fontscale 1.0 size 30, 15
set encoding utf8
if (!exists("fileout")) fileout='histograms.5.png'
set output fileout
set bar 1.000000 front
set border 11 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.75 absolute
set style fill solid 1.00 border lt -1
set style circle radius graph 0.02, first 0.00000, 0.00000 
set style ellipse size graph 0.05, 0.03, first 0.00000 angle 0 units xy
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linewidth 0.500,  lt 0 linewidth 0.500
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set key invert samplen 4 spacing 1.5 width 0 height 0
unset key
set style histogram rowstacked title textcolor lt -1
set style textbox transparent margins  1.0,  1.0 border
unset logscale
set datafile missing '-'
#set style data histograms
set xtics border in scale 0,0 nomirror rotate by 0 autojustify
set xtics   0,1,10
set xrange [ 0.00000 : 11.000 ] reverse nowriteback
unset ytics
set ylabel ""
set ytics border in scale 0.5,0 nomirror rotate by 0 autojustify
set ytics 0,1,10
set ytics  norangelimit
set y2label "(%)"
set y2tics border in scale 0.5,0 nomirror rotate by 0 autojustify
set y2tics 0,10,100
set y2range [ 100.00000 : 0.000 ] reverse nowriteback
set arrow from graph 0,0.95 to graph 0,1 size screen 0.09,10,30 \
    filled ls 0
set arrow from graph 1,0.05 to graph 1,0 size screen 0.09,10,30 \
    filled ls 0
set colorbox vertical origin screen 0.9, 0.2, 0 size screen 0.05, 0.6, 0 front  noinvert bdefault
x = 0.0
set linetype 1 lc rgb "dark-blue"        lw 2 pt 5 
set linetype 2 lc rgb "dark-red"	        lw 15 pt 0
set linetype cycle 2

if (!exists("filein")) filein='notas.dat'
plot filein u 1:2 with boxes t "Contagem",  '' u 1:(100.*$3):xtic(1) axes x1y2 w lp t "Percentil"
