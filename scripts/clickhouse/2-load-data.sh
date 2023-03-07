#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)


usage() {
cat <<EOM
Usage: $(basename $0) <dataset-dir>
  dataset-dir    path to dataset root directory
EOM
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi
DATASET_DIR="$1"

cd $DATASET_DIR/PublicBIbenchmark
ret=$?
if [ $ret -ne 0 ]; then
	exit $ret
fi


SCRIPTS="\
$SCRIPT_DIR/lib/1-create-Clickhouse-load_sql.sh \
$SCRIPT_DIR/lib/2-Clickhouse-load-data.sh"

for s in $SCRIPTS
do
	echo "$(date) running: $s"
	$s
	ret=$?
	if [ "$ret" -ne 0 ]; then
		exit $ret
	fi
done


echo "$(date) done"
