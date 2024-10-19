#!/usr/bin/bash

annee=$1
entitetype=$2

cat ../../../ann/$annee/*.*|grep $entitetype |wc -c
