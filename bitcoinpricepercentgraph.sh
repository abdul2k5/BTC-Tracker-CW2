#!/bin/bash

function bitcoin_pricechange() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT change_percent, price FROM prices;" --skip-column-names > bitcoin_pricechange.dat
    gnuplot <<EOF
set terminal png
set title "price/changepercent"
set xlabel "Price"
set ylabel "Change Percent"
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinpricechangepercent.png'
plot 'bitcoin_pricechange.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_pricechange
