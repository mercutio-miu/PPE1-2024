#!/usr/bin/bash

echo "Annotations de locations en 2016 :"
cat ../../ann/2016/*.*|grep "Location"|wc -c
echo "Annotations de locations en 2017 :"
cat ../../ann/2017/*.*|grep "Location"|wc -c
echo "Annotations de locations en 2018 :"
cat ../../ann/2018/*.*|grep "Location"|wc -c
