#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo"$0 comprend 1 argument, nom/chemin de fichier"
	exit1
fi

urlfile=$1
N=0
while read -r line
do
	N=$( expr $N + 1)
	echo "$N	${line}"
done < $urlfile
