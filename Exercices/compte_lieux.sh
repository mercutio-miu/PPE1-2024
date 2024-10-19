#!/usr/bin/bash

annee=$1
mois=$2
nbrlieux=$3


cat ../../../ann/$annee/*_"$mois"_* | grep Location | cut -f 3 | sort | uniq -c | sort -n|tail -n $nbrlieux
