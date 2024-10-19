#!/usr/bin/bash

entitetype=$1

echo "Annotations en 2016 : "
bash compte_par_type.sh 2016 $entitetype
echo "Annotations en 2017 : "
bash compte_par_type.sh 2017 $entitetype
echo "Annotations en 2018 : "
bash compte_par_type.sh 2018 $entitetype
