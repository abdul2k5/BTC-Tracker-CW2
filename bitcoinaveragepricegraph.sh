#!/bin/bash

function bitcoin_average_price() {    
    read AVERAGE_PRICE YEAR < average_price.dat
    gnuplot <<EOF
set terminal png
set title "Bitcoin Average Price"
set xlabel "Year"
set ylabel "Price"
set xtics rotate 
set yrange [2023:2025]
set xrange [55000:65000]
set output 'bitcoin_averageprice.png'
plot '-' using 1:2 with points pointtype 7 pointsize 2 title 'Average Price'
$YEAR $AVERAGE_PRICE
EOF
}

bitcoin_average_price
