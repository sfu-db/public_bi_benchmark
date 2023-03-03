#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

usage() {
cat <<EOM
Usage: $(basename $0) <destination-dir> <dataset-name>
  datasaet-name      name of the dataset
EOM
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

DATASET=$1

mclient --version > /dev/null
ret=$?
if [ "$ret" -ne 0 ]; then
	echo "error: unable to connect to MonetDB"
	exit $ret
fi


for f in $SCRIPT_DIR/../../benchmark/$DATASET/tables/*.table.sql
do
	echo "$(date) $f"
	mclient $f
	ret=$?
	echo $ret > "$f.ret"
done


echo "$(date) done"
