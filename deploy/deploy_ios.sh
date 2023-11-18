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
flutter build ipa --export-options-plist ../ios/export.plist --release --build-number="$NUMVERSION" --build-name=0.2.0
