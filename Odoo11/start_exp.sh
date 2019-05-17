#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPTNAME="`readlink -e "$0"`"
SCRIPTDIR="`dirname "$SCRIPTNAME"`"


cd "$SCRIPTDIR"

mkdir -p results
docker-compose up

cd odoo/csvfolder
find  -type f  -iname '*.csv'  -size +63c  -exec echo cp '{}' ../../results ';'
rm *

