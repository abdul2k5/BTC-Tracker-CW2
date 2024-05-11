#!/bin/bash

function bitcoin_price() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT price, timestamp FROM prices;" --skip-column-names > bitcoin_price.dat
    gnuplot <<EOF
set terminal png
set title "Price of Bitcoin"
set xlabel "Time"
set ylabel "Price"
set xdata time 
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%m/%d %H:%M'
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinprice.png'
plot 'bitcoin_price.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_price
