#!/usr/bin/bash

annee=$1
mois=$2
nbrlieux=$3


if [ -d ../../../ann/$annee ]
then
    if [ "$nbrlieux" -gt 0 ]
    then
        cat ../../../ann/$annee/*_"$mois"_* | grep Location | cut -f 3 | sort | uniq -c | sort -n|tail -n $nbrlieux
    else
        echo "donner un nombre de ligne du classement"
    fi
else
    echo "le(s) fichier(s) n'existe(nt) pas ou donner l'annee/mois"
fi
