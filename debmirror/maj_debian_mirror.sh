#!/bin/bash -x
# L'option -x permet une exécution en mode debuggage, utile pendant la mise au point du script.
# Veiller à l'enlever lorsque le script fonctionne.

#Définition des variables pour Debian
hote="ftp.fr.debian.org"
racine="debian/"
methode="rsync"     # rsync semble fonctionner maintenant et est plus économe en bande passante
                    # au choix ftp|hftp|http|rsync
distribution="buster"
sections="main,contrib,non-free"
                     # Si le dépôt doit servir à une installation de la distribution via un boot PXE, il faut ajouter 
                     # « main/debian-installer » à « section ». 
                     # sections="main,main/debian-installer,contrib,non-free"
cible="/media/data/mirror/debian/"
architecture="amd64" # ajouter d'autres architectures séparées par des virgules si nécessaire
                    # « i386,amd64 »

#Commande pour synchroniser le mirroir avec Debian
/usr/bin/debmirror --nosource --passive --method=$methode \
--root=$racine --dist=$distribution --host=$hote \
--section=$sections --arch=$architecture $cible \
--getcontents --ignore-release-gpg --progress
# Une fois le script validé, il est possible d'enlever l'option « -- progress »
# Cette option ne servira plus une fois le script lancé en tâche journalière.
# Cette option ne sert qu'à visualiser la progression du script.
