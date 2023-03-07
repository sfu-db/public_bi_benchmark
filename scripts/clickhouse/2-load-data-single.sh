#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)


usage() {
cat <<EOM
Usage: $(basename $0) <dataset-dir>
  dataset-dir    path to dataset root directory
  datasaet-name      name of the dataset
EOM
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi
DATASET_DIR="$1"
DATASET="$2"

cd $DATASET_DIR/PublicBIbenchmark
ret=$?
if [ $ret -ne 0 ]; then
	exit $ret
fi


echo "$(date) running: $SCRIPT_DIR/lib/1-create-Clickhouse-load_sql-single.sh $DATASET"
$SCRIPT_DIR/lib/1-create-Clickhouse-load_sql-single.sh $DATASET
ret=$?
if [ "$ret" -ne 0 ]; then
	exit $ret
fi

echo "$(date) running: $SCRIPT_DIR/lib/2-Clickhouse-load-data-single.sh $DATASET"
$SCRIPT_DIR/lib/2-Clickhouse-load-data-single.sh $DATASET
ret=$?
if [ "$ret" -ne 0 ]; then
	exit $ret
fi

cd -

echo "$(date) done"
