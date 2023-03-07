#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

for f in $SCRIPT_DIR/../../benchmark/*/queries-clickhouse/*.sql
do
	echo "$(date) $f"
	$CLICKHOUSE -t --queries-file $f > "$f.out" 2> "$f.err"
	ret=$?
	echo $ret > "$f.ret"
done


echo "$(date) done"
