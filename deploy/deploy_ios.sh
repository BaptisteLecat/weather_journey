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

#flutter pub run flutter_launcher_icons:main
pwd
flutter build ipa --export-options-plist ../../export.plist --release --build-number="$NUMVERSION" --build-name=0.2.0
