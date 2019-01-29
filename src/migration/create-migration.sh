#!/bin/bash

CMDNAME=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMDNAME <<migration-name>>" 1>&2
  exit 1
fi

DateTime=`date '+%Y%m%d%H%M%S'`
Dir=`dirname $0`
FileName="${DateTime}-${1}.sql"
cd ${Dir}

echo -e "-- +migrate Up\n\n" > "${FileName}"
echo -e "-- +migrate Down\n" >> "${FileName}"

echo "migration file ${Dir}/${FileName} created."
