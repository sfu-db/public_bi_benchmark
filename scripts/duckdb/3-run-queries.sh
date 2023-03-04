#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
WORKING_DIR=$(pwd)


for f in $SCRIPT_DIR/../../benchmark/*/queries-duckdb/*.sql
do
	echo "$(date) $f"
	$DUCKDB < $f > "$f.out" 2> "$f.err"
	ret=$?
	echo $ret > "$f.ret"
done

echo "$(date) done"
