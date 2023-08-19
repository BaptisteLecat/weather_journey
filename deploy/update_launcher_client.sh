#!/bin/sh
set -e 

for i in $@; do
    CLIENT=$i

    if [ -z $CLIENT ]; then
        echo "Paramètre manquant"
        exit 1
    fi
    cd ..
    cd asset
    SYMLINK="launcher"
    TARGET="/Users/ogermax/Documents/Developpement/kazamobile/asset/clients/$CLIENT/$SYMLINK"

    # Le répertoire cible existe ?
    if [ ! -d $TARGET ]; then
        echo "$TARGET n'existe pas ou n'est pas un répertoire"
        exit 1
    fi

    # le lien symbolique existe déja ?
    if [ -e $SYMLINK ]; then
        if [ ! -L $SYMLINK ]; then
            echo "$SYMLINK existe mais n'est pas un lien symbolique !"
            exit 1
        else
            echo "suppression du lien symbolique existant $SYMLINK"
            rm -f "/Users/ogermax/Documents/Developpement/kazamobile/assets/$SYMLINK"
        fi
    fi

    echo "Création du lien symbolique $SYMLINK"
    ln -s $TARGET
    # cd ..
    echo "Implémentation des logos $CLIENT"
    flutter pub run flutter_launcher_icons:main
    # echo "Run $CLIENT"
    # flutter run --flavor $CLIENT
    cd ..
done





