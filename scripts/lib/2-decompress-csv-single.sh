#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

usage() {
cat <<EOM
Usage: $(basename $0) <destination-dir> <dataset-name>
  destination-dir    path to directory where the dataset will be stored
  datasaet-name      name of the dataset to be decompressed
EOM
}

if [ "$#" -ne 2 ]; then
    usage
    exit 1
fi
DST_DIR="$1"

cd $DST_DIR
ret=$?
if [ $ret -ne 0 ]; then
    exit $ret
fi

DATASET="$2"

d="$DST_DIR/PublicBIbenchmark/$DATASET"

echo "data path: $d"

cd $d
for file in ./*.bz2; do
	echo "$(date) decompressing $file"
	bzip2 -dk $file &
done
cd -
wait

echo "$(date) done"
