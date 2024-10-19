#!/usr/bin/bash

annee=$1
entitetype=$2

if [ -d ../../../ann/$annee ]
then
    if [ -n "$entitetype" ]
    then
        cat ../../../ann/$annee/*.*|grep $entitetype |wc -c
    else
        echo "taper un type d'entite"
    fi
else
    echo "le(s) fichier(s) n'existe(nt) pas ou donner l'annee"
fi
