#!/bin/bash
set -e

idms="/idam-client-setup.sh";
ccds="/do-ccd-init.sh";
upc="/ccd-import-definition.sh definitions.xlsx"
all="${idms} && ${ccds} && ${upc}"

"/wait"

if [ "$1" == "all" ]
then
   ${idms} && ${ccds} && ${upc}
else 
  ${upc}
fi
