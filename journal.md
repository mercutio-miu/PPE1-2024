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

Cette ligne doit rester après correction

Mon git est sans arrêt bloqué à chaque fois que je fais les manipulations ce qui veut dire que clairement j'ai pas du tout compris comment faire donc je vais arrêter de cloner et recloner pour pouvoir recommencer à chaque fois car ça marche vraiment pas et j'attendrais des explications plus en détails pour pouvoir avoir toutes les compétences pour pouvoir gérer ce hellhole qu'est github.

## EX SCRIPTS

- Pour l'exercice 1, juste écrit la ligne #!/usr/bin/bash , puis coller le travail de la question du devoir précédent.

- Pour l'exercice 2a, même chose, juste transformé l'argument de grep avec une variable et l'année aussi(bien mettre $ avant le nom de la variable renommée).Dans script2: appel de l'autre script dans le script, RAS

- 2b: pour mettre une variable dans un argument, la mettre entre ""

mais avec * pour mois et année:

`cat: '../../../ann/classement2016.txt/*_classement2017.txt_*': No such file or directory
tail: invalid number of lines: ‘classement2018.txt’` ?????????????????? jen ai marre de problème dont jai pas limpression quon ma donné ce quil fallait pour le résoudre
why the fuck il prendrait le nom de fichier qui se trouve dans le dossier ou se trouve le fichier shell, genre je sais pas machine, fait un effort parce que à certains moments ce truc est débile

donc non il accepte pas * parce que même en relisant le cours je trouve pas de solution et trois pages internet plus tard j'en sais pas plus alors je sais pas si je suis plus bête que les autres mais wtf

- 3: utiliser les conditions if [-f file, -d dossier] pour vérifier les arguments

- 4: fait une boucle for à la place de mettre plusieurs fois echo et cat etc

- ->si la variable # est différente de 1 alors stdout = "ce programme demande un argument" et arrêter le script avec explications (donc s'il n'y a pas un argument quitter le programme avec un message d'erreur)
->la variable FICHIER_URLS est le premier arg, OK est égale à 0 et NOK aussi
->tant que lecture de LINE (lecture dans variable FICHIER_URLS qui devrait être un fichier avec peute^tre des url sur certaines lignes):
stdout "la ligne:"+valeur de LINE
si la ligne commence par https:// s optionnel, stdout = "ressemble à une URL valide" et OK += 1, sinon stdout = "ne ressemble pas à une url" et NOK += 1
quand fini de lire FICHJER_URL stdout = "nouvellevaleur de OKS + URLS et nouvelle valeurs de NOK + lignes douteuses"
soit c'est un programme pour reconnaitrecombien de lignes sur lesquelles se trouve possiblement un URL ou non.

## MINI PROJET

### Ex 1
- 1 cat demande pour argument un nom de fichier, donc on utilise echo:
\>> cat: 'https://fr.wikipedia.org/wiki/Robot': No such file or directory

- 2 avec boucle if on vérifie que le nombre d'argument est 1: (si le nombre d'arguments est différent de 1, meassage d'erreur et exit)

- 3 en utilisant une variable qui augmente de 1 à chaque fois qu'elle passe dans la boucle while et en mettant une chaine de caractère dans echo (pas besoin de \t appremment juste utiliser tab du clavier = ok ?)

### Ex 2

- 1 (utilisation du code dans le cours du script pour ne traiter que les lignes avec des url appremment valide)
essai avec  `curl -L -I ${line} | egrep -o "HTTPS?/[0-2](.[0-9][0-9]?)?"`
            `curl -L -I ${line} | egrep -o "charset=.*"`
    mais on se retrouve avec:
\>>   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0 45914    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
et je sais pas comment l'enlever. et j'arrive à rien avec curl et jen ai marre


