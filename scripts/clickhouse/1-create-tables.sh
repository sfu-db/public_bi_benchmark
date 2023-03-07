#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)

for f in $SCRIPT_DIR/../../benchmark/*/tables/*.table.sql
do
	echo "$(date) $f"
	$CLICKHOUSE $f
	ret=$?
	echo $ret > "$f.ret"
done


echo "$(date) done"
