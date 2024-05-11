#!/bin/bash

function bitcoin_changepercent() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT change_percent, timestamp FROM prices;" --skip-column-names > bitcoin_changepercent.dat
    gnuplot <<EOF
set terminal png
set title "Change Percent"
set xlabel "Time"
set ylabel "Change Percent"
set xdata time 
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%m/%d %H:%M'
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinchangepercent.png'
plot 'bitcoin_changepercent.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_changepercent
