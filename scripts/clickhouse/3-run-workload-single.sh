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

f=tmp.sql
$SCRIPT_DIR/lib/3-create-Clickhouse-workload-single.sh $SCRIPT_DIR/../../benchmark/$DATASET/queries-clickhouse 3 $f
echo "$(date) $f"
$CLICKHOUSE -t --queries-file $f > "$f.out" 2> "$f.err"
ret=$?
echo $ret > "$f.ret"
echo "$(date) done"
