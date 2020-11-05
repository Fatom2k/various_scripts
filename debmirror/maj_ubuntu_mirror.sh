#!/bin/bash -x
# L'option -x permet une exécution en mode debuggage, utile pendant la mise au point du script. 
# Veiller à l'enlever lorsque le script fonctionne.

#Définition des variables
hote="fr.archive.ubuntu.com"
racine="ubuntu/"
methode="rsync"     # rsync semble fonctionner maintenant et est plus économe en bande passante
                    # au choix ftp|hftp|http|rsync

                    # Mettre ici toutes les distributions que vous souhaitez. 
                    # Au 13 novembre 2008, on pourrait mettre
#distribution="hardy,hardy-updates,hardy-security,intrepid,intrepid-updates,intrepid-security,jaunty,jaunty-updates,jaunty-security"
distribution="groovy,groovy-updates,groovy-security"
                    # Lorsque Jaunty sera stable, il suffira d'enlever Intrepid du script et le dépôt sera nettoyé
                    # distribution="hardy,hardy-updates,hardy-security"
sections="main,multiverse,universe,restricted"
                    # Si le dépôt doit servir à une installation de la distribution via un boot PXE, il faut ajouter 
                    # « main/debian-installer » à « section ». 
                    # sections="main,multiverse,universe,restricted,main/debian-installer"
cible="/media/data/mirror/ubuntu/"
architecture="amd64" # ajouter d'autres architectures séparées par des virgules si nécessaire
                    # « i386,amd64 »

#Commande pour synchroniser le mirroir avec Ubuntu
/usr/bin/debmirror --nosource --passive --host=$hote \
        --root=$racine --method=$methode --progress --dist=$distribution \
        --ignore-release-gpg --section=$sections \
        --arch=$architecture $cible
