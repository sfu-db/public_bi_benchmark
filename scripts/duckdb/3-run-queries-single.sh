#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

usage() {
cat <<EOM
Usage: $(basename $0) <dataset-dir>
  datasaet-name      name of the dataset
EOM
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi
DATASET="$1"


for f in $SCRIPT_DIR/../../benchmark/$DATASET/queries-duckdb/*.sql
do
	echo "$(date) $f"
	$DUCKDB < $f > "$f.out" 2> "$f.err"
	ret=$?
	echo $ret > "$f.ret"
done


echo "$(date) done"
