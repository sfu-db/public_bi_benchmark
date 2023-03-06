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

QUERY_PATH="$SCRIPT_DIR/../../benchmark/$DATASET/queries-duckdb"

mkdir -p $QUERY_PATH
for f in $SCRIPT_DIR/../../benchmark/$DATASET/queries-monetdb/*.sql
do
    # cp $f $QUERY_PATH
    fb="$(basename $f)"
	cat $f | sed 's/locate(\(.*\),\(.*\))>0/instr(\2,\1)>0/g' > $QUERY_PATH/$fb
done

echo "$(date) done"