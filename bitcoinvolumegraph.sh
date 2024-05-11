#!/bin/bash

function bitcoin_volume() {
    /opt/lampp/bin/mysql -u root -e "USE bitcoin_tracker; SELECT volume_24hr, timestamp FROM assets;" --skip-column-names > bitcoin_volume.dat
    gnuplot <<EOF
set terminal png
set title "Volume24hr"
set xlabel "Time"
set ylabel "Volume_24hr"
set xdata time 
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%m/%d %H:%M'
set xtics rotate 
set style line 1 linecolor rgb '#ff0000' linetype 1 linewidth 1 pointtype 7 pointsize 1
set output 'bitcoinvolume.png'
plot 'bitcoin_volume.dat' using 2:1 with linespoints ls 1
EOF
}
bitcoin_volume
