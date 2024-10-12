# Journal de bord du projet encadré

## exercice 1 github
création de la repositery et du journal
utilsation git status pour 2.b.1
-> n'a pas mentionné de retard avant utilisation de git fetch ?
utilisation git fetch et git pull pour 2.b.2
toujours pas compris ce à quoi git add peut bien servir et par extension git commit et par plus grande extension github en lui_même
-> git add : modifications tenues en compte par git?
-> git commit : ce qui sera exporté avec push ?

vérification que rien n'avait été ajouté sur git profs

## exercie 2 pipelines

Premièrement il faut comprendre ce qui est attendu dans le fichier comptes.txt, de la manière dont je vois les choses:

- "Annotations en 2016" n'est pas une stdout ou stederr donc cela devra être fait avec echo
- le nombre d'annotations est le nombre de ligne dans chaque fichier car 1 ligne = 1 annotation ?
- d'après `wc --help`, l'option -c permettrait de montrer le nombre de ligne (newlines)

Mais wc -c montre chaque fichiers avec nombre de ligne et affiche au final le nombre de ligne et total à côté, donc ce n'est pas ce qui doit apparaître dans le fichier final. -> Ne pas mettre les fichiers mais cat avec pipes pour un "texte" entier : donne reponse simple

pour 1.b, utilisation de grep car on s'intéresse aux lignes avec "Location".

Pour l'exercice 2, il faut :

- trier les lignes pour réunir celles avec la même location
- pouvoir compter les occurence pour chaque location
- afficher ces occurences suivi du nom de la location

uniq -c permettra de mettre le format nbr d'occurence nom location
grep pour location?
cut permettra sans doute à couper les lignes en gardant ce qu'on veut mais comment? of ça marche avec des séparatuer/field, automatiquement des tabs je crois?

`cat ../../../ann/2016/*.*|grep "Location"| cut -f 3 | uniq`
pourquoi uniq ne marche pas?? après cut il y a bien des ligne avec une location?? du coup pourquoi il reste encore autant de doublons??? est-ce que c'est un truc d'encodage ou c'est les commandes?? car certaines locations sont bien réunies mais la majeure partie non du coup what?? ugh

je vois pas pourquoi ça marcherait pas alors je laisse ça comme ça parce que vraiment je sais pas ce qui va pas car là ça fait bien:
- output = tous les fchiers ann de 2016
- on prend les lignes avec location
- on ne prend que le field avec la location
- on réunit les doublons en les comptant

et c'est ce qu'on veut et ce qui devrait marcher alors je sais pas ce qui peut être fait de plus.

Pour la dernière partie, le mois se trouve dans le nom du fichier et l'annotation Date renvoie à la date du nom du fichier. (besoin du texte à l'intérieur pour le noter dans le fichier je pense)
Il y a plusieurs fichiers pour un jour du coup je présume que la consigne c'est pour un certain mois (ici choisissons octobre, contemporain) mettre combien de fichier pour un même jour de ce mois, que ce soit en 2016 ou les autres années?? Pas la plus claire des consgnes tbh.

ce qu'il faut serait donc :

- trier les fichiers pour garder ce du mois d'octobre
- réunir ce qui ont été fait le même jour
- les présenter dans un fichier comme pour l'ex 2a

je suis pas sûr à quoi tail et sort me sont utiles ici? ce qui pourrait m'indiquer que je suis sur la mauvaise direction mais vraiment j'ai pas de solutions avec ces commandes alors voilà.

Quand on prend tous les fichiers d'octobre (20\*_10_\*) et que l'on utilise grep "octobre" ( pas "Date" car il y a des années), on se rend compte que certaines date contiennent le jour de la semaine et n'ont donc pas le même format que les autres (yay). sort --help (ça devait être écrit dans la console mais maintenant c'est noter ici ce que je suis allé vérifié pour trier ces lignes)
dimanche 1 er octobre devrait compter comme tous les autres 1er octobre n'est ce pas? sigh
j'ai essayé de voir si je pouvais pas faire à partir des noms de fichiers mais pas très probant, je sais pas comment les cut

j'ai compris comment cut marche un peu mieux -d "mettre separateur" -f quel part dans la séparation(1 ou 1,2 ou 1-4 par ex)

il faudrait quelque chose qui garde que les valeurs numériques? jsp

wait est-ce qu'il fallait retrier les locations mais pour 1 mois? jsp ces consignes sont pas des plus clairs du cou pobligé de yolo.

## EX git ERROR seance3

