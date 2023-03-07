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


for f in "$DATASET"/*.csv
do
    o="${f%.csv*}.ch.csv"
    cat $f | awk -F'|' '{print NR"|"$0}' > $o
    echo "generated $o"
done

cd -
echo "$(date) done"