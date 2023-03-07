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

for f in $SCRIPT_DIR/../../benchmark/$DATASET/tables-clickhouse/*.table.sql
do
	echo "$(date) $f"
	$CLICKHOUSE --queries-file $f
	ret=$?
	echo $ret > "$f.ret"
done


echo "$(date) done"
