#!/bin/bash

function bitcoin_maxsupplymarketcap() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT max_supply, market_cap FROM assets;" --skip-column-names > bitcoin_maxsuppplymarketcap.dat
    gnuplot <<EOF
set terminal png
set title "Market Cap/Max Supply"
set xlabel "Market Cap"
set ylabel "Max Supply"
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinmaxsupplymarketcap.png'
plot 'bitcoin_maxsuppplymarketcap.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_maxsupplymarketcap
