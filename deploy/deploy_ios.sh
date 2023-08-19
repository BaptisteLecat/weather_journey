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

#flutter pub run flutter_launcher_icons:main
cd "$DEPLOY_PATH"
flutter build ipa --build-number="$NUMVERSION" --build-name=0.1.0+1
