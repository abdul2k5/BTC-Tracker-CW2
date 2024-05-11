#!/bin/bash

function bitcoin_volumemaxsupply() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT max_supply, volume_24hr FROM assets;" --skip-column-names > bitcoin_volumemaxsupply.dat
    gnuplot <<EOF
set terminal png
set title "Volume24hr/Max Supply"
set xlabel "Volume_24hr"
set ylabel "Max Supply"
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinvolumemaxsupply.png'
plot 'bitcoin_volumemaxsupply.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_volumemaxsupply
