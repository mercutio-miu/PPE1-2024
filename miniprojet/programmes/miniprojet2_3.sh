#!/usr/bin/env bash

if [ $# -ne 1 ]
then
	echo"$0 comprend 1 argument, nom/chemin de fichier"
	exit1
fi

urlfile=$1
echo "<html><head></head><body>" >> tableaux/tableauurl.html

echo "<table><tr><th>id</th><th>url</th><th>code http</th><th>encoding</th><th>nb mots</th></tr>" >> tableaux/tableauurl.html

N=1
while read -r line
do
    if [[ $line =~ ^https?:// ]]
    then
        infopage=$(curl -s -L -w "%{http_code}\t%{content_type}" -o /tmp/file.html $line)
        http=$( echo "$infopage" | cut -f 1 )
        encod=$(echo "$infopage" | cut -f 2 | grep -P -o "charset=\S+" | cut -d '=' -f 2)
        nbmots=$( lynx -dump -nolist /tmp/file.html | wc -w )
        echo -e "<tr><td>$N</td><td>${line}</td><td>$http</td><td>$encod</td><td>$nbmots</td></tr>" >> tableaux/tableauurl.html
        N=$( expr $N + 1)
    fi
done < $urlfile

echo "</table>" >> tableaux/tableauurl.html
echo "</body></html>" >> tableaux/tableauurl.html

