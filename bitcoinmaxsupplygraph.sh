#!/bin/bash

function bitcoin_maxsupply() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT max_supply, timestamp FROM assets;" --skip-column-names > bitcoin_maxsupply.dat
    gnuplot <<EOF
set terminal png
set title "Max Supply"
set xlabel "Time"
set ylabel "Max Supply"
set xdata time 
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%m/%d %H:%M'
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinmaxsupply.png'
plot 'bitcoin_maxsupply.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_maxsupply
