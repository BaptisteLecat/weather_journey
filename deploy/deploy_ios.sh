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
CURRENT_DIR=$(pwd)
EXPORT_PLIST=$CURRENT_DIR/export.plist

flutter build ipa --export-options-plist "$EXPORT_PLIST" --release --build-number="$NUMVERSION" --build-name=0.2.0
