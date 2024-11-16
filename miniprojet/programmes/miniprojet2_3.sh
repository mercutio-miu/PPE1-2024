#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo"$0 comprend 1 argument, nom/chemin de fichier"
	exit1
fi

urlfile=$1

echo "<table><tr><th>id</th><th>url</th><th>code http</th><th>encoding</th><th>nb mots</th></tr>" >> tableaux/tableauurl.html

N=1
while read -r line
do
    if [[ $line =~ ^https?:// ]]
    then
        http=$( curl  -s -L -I -w "%{http_code}" ${line} | tail -n 1 )
        encod=$(curl -s -L -I -w "%{content_type}" ${line} | tail -n 1 | grep -P -o "charset=\S+" | cut -d '=' -f 2)
        nbmots=$( lynx -dump -nolist $line | wc -w )
        echo -e "<tr><td>$N</td><td>${line}</td><td>$http</td><td>$encod</td><td>$nbmots</td></tr>" >> tableaux/tableauurl.html
        N=$( expr $N + 1)
    fi
done < $urlfile

echo "</table>" >> tableaux/tableauurl.html
