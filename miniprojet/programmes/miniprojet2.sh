#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo"$0 comprend 1 argument, nom/chemin de fichier"
	exit1
fi

urlfile=$1
N=1
while read -r line
do
    if [[ $line =~ ^https?:// ]]
    then
        http=$( curl  -s -L -I -w "%{http_code}" ${line} | tail -n 1 )
        encod=$(curl -s -L -I -w "%{content_type}" -o dev/null ${line} | egrep -o "charset=\S+" | cut -d '=' -f2)
        nbmots=$( lynx -dump -nolist $line | wc -w )
        echo -e "$N\t${line}\t$http\t$encod\t$nbmots" >> "tableaux/tableauurl.tsv"
        N=$( expr $N + 1)
    fi
done < $urlfile

