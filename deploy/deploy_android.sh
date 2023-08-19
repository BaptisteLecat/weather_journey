#!/bin/sh
set -e

NUMVERSION=$1
shift

if [ -z "$NUMVERSION" ]; then
    echo "Il manque le numéro de version"
    exit 1
else
    echo "Version : $NUMVERSION"
fi

SCRIPT_PATH=$(dirname "$0")
ASSET_PATH="$SCRIPT_PATH/../asset"
DEPLOY_PATH="$SCRIPT_PATH"

for i in "$@"; do
    CLIENT="$i"

    if [ -z "$CLIENT" ]; then
        echo "Paramètre manquant"
        exit 1
    fi

    cd "$ASSET_PATH"
    SYMLINK="launcher"
    TARGET="$ASSET_PATH/clients/$CLIENT/$SYMLINK"

    # Le répertoire cible existe ?
    if [ ! -d "$TARGET" ]; then
        echo "$TARGET n'existe pas ou n'est pas un répertoire"
        exit 1
    fi

    # le lien symbolique existe déjà ?
    if [ -e "$SYMLINK" ]; then
        if [ ! -L "$SYMLINK" ]; then
            echo "$SYMLINK existe mais n'est pas un lien symbolique !"
            exit 1
        else
            echo "suppression du lien symbolique existant $SYMLINK"
            rm -f "$SYMLINK"
        fi
    fi

    echo "Création du lien symbolique $SYMLINK"
    ln -s "$TARGET" "$SYMLINK"

    cd "$SCRIPT_PATH/.."
    echo "Implémentation des logos $CLIENT"
    flutter pub run flutter_launcher_icons:main
    echo "Build $CLIENT"
    flutter build appbundle --build-number="$NUMVERSION" --flavor "$CLIENT" -t "lib/main_$CLIENT.dart"
    cd "$DEPLOY_PATH"
done
