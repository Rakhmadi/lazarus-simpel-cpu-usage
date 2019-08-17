#!/bin/bash

# render *.png glyphs

rsvg-convert add.svg -w 16 -h 16 -o addL.png
rsvg-convert closenorm.svg -w 14 -h 14 -o closeL.png
rsvg-convert closenorm.svg -w 12 -h 12 -o closenorm.png
rsvg-convert closeinact.svg -w 12 -h 12 -o closeinact.png
rsvg-convert closedis.svg -w 12 -h 12 -o closedis.png
rsvg-convert closehigh.svg -w 12 -h 12 -o closehigh.png
rsvg-convert fullcircle.svg -w 12 -h 12 -o fullcircle12.png
rsvg-convert zero.svg -w 12 -h 12 -o zero12.png
