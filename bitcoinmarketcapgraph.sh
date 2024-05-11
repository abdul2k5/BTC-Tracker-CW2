#!/bin/bash

function bitcoin_marketcap() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT market_cap, timestamp FROM assets;" --skip-column-names > bitcoin_marketcap.dat
    gnuplot <<EOF
set terminal png
set title "Market Cap"
set xlabel "Time"
set ylabel "Market Cap"
set xdata time 
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%m/%d %H:%M'
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinmarketcap.png'
plot 'bitcoin_marketcap.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_marketcap
