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
CH_DIR="$SCRIPT_DIR/../../benchmark/$DATASET/tables-clickhouse"

mkdir -p $CH_DIR

for f in $SCRIPT_DIR/../../benchmark/$DATASET/tables/*.table.sql
do
	t=$(basename $f)
	cat $f | sed '2i \ \ \"ID\" UInt32,' | sed 's/;/\nENGINE MergeTree()\nPRIMARY KEY (ID);/' > $CH_DIR/$t
done