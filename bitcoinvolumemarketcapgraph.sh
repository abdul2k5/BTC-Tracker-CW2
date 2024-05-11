#!/bin/bash

function bitcoin_volumemarketcap() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT market_cap, volume_24hr FROM assets;" --skip-column-names > bitcoin_volumemarketcap.dat
    gnuplot <<EOF
set terminal png
set title "Market Cap/Volume_24hr"
set xlabel "Volume_24hr"
set ylabel "Market Cap"
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinvolumemarketcap.png'
plot 'bitcoin_volumemarketcap.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_volumemarketcap
