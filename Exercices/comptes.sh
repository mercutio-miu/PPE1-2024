#!/usr/bin/bash

for el in 2016 2017 2018
do
    echo "Annotations de locations en $el :"
    cat ../../../ann/$el/*.*|grep "Location"|wc -c
done
