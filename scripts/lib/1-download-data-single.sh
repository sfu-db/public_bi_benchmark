#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

BASE_URL="https://homepages.cwi.nl/~boncz/PublicBIbenchmark"

usage() {
cat <<EOM
Usage: $(basename $0) <destination-dir> <dataset-name>
  destination-dir    path to directory where the dataset will be stored
  datasaet-name      name of the dataset to be downloaded
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

mkdir -p "$DST_DIR/PublicBIbenchmark"

DATASET="$2"

wb_path="$SCRIPT_DIR/../../benchmark/$DATASET"
wb="$(basename $wb_path)"
mkdir -p "$DST_DIR/PublicBIbenchmark/$wb"
for f in $wb_path/samples/*
do
    t="$(basename $f)"; t="${t%.sample.csv}"
    curl -k "$BASE_URL/$wb/$t.csv.bz2" -o "$DST_DIR/PublicBIbenchmark/$wb/$t.csv.bz2"
done
