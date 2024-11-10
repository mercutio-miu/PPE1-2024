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
    if [[ $line =~ ^https?:// ]]
    then
        N=$( expr $N + 1)
        http=$( curl -L -I ${line} | egrep -o "HTTPS?/[0-2](.[0-9][0-9]?)?" )
        curl=$(curl -L -I ${line} | egrep -o "charset=.*")
        echo"$N	${line}    $http    $encod"
    fi
done < $urlfile

