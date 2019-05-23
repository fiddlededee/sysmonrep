if (!exists("fileName")) fileName='../out/ca040010_skatdir'

set terminal pngcairo size 2100,800 enhanced font "PT Sans,14"
set encoding utf8
set output sprintf('%s.png', fileName)
set datafile separator ","


set key inside Left left reverse
set key autotitle columnhead
set key maxrows 1

c1 = "#42b3d5"; c11="#b8dbe5"; 
c2 = "#e4521b"; c21 = "#f2bdaa";  
c3 = "#4dbf4c"; 
c4 = "#4c60bf"
c5 = "#354d6e"

set key font ", 26"

set tics textcolor "#000000"
set tics font ", 24"


set xtic nomirror
set xtic out            
set xtic scale 1, 0            
set xtics offset 0, -0.2, 0
set xtics rotate by 90 right
#set grid xtics


set ytics nomirror

set style data lines
set grid ytics
set ytic scale 0
set ytics offset -2, 0, 0



set style line 1 lt 2 lw 6 pt 7 ps 2 lc rgb c1
set style line 2 lt 2 lw 2 pt 7 ps 2 lc rgb c2
set style line 3 lt 2 lw 6 pt 7 ps 2 lc rgb c3
set style line 4 lt 2 lw 6 pt 7 ps 2 lc rgb c4
set style line 5 lt 2 lw 6 pt 7 ps 2 lc rgb c5

set style line 101 lt 2 lw 4 pt 3 ps 0.5 lc rgb "#BBBBBB"
set style line 102 lt 2 lw 2 pt 3 ps 0.5 lc rgb "#BBBBBB" 
set style line 103 lt 2 lw 2 pt 3 ps 0.5 lc rgb "#BBBBBB" dt 3

set grid back ls 103

set border 5 ls 101

set boxwidth 60*30 absolute
set style fill solid 1.0

#set terminal unknown



set style textbox opaque border rgb "#FFFFFF" lw 0 fillcolor rgb "#FFFFFF" margins 3,3
set lmargin 15
set rmargin 5
set tmargin 2
set bmargin 10 

stats sprintf('%s.csv', fileName) using 2 
set yr [0:STATS_max * 1.1]

set xdata time
set timefmt '%d.%m.%Y %H'
set format x "%d.%m %H:00"


plot  sprintf('%s.csv', fileName) using 1:2 notitle ls 2 with boxes, \
	"" using 1:2:2 notitle with labels offset 0, 1 font ", 18", \

#plot  sprintf('c%s.csv', fileName) using ($0):(1/0) notitle , \
#      "" using ($0):2:2 notitle with labels offset 0, 1 font ", 22", \
#      "" using ($0):2 notitle ls 5 with boxes, \
      
      
#     "" using ($0):($2/$3*100):(sprintf("%d из %d", $2, $3)) notitle with labels font ", 36" offset 0,2 

