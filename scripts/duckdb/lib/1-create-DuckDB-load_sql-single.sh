#!/bin/bash

# create SQL load scripts for DuckDB
# using COPY INTO statements
# count of rows of CSV file


d=$1
for f in "$d"/*.csv
do
	echo "$(date) $f"

	t="${f##*/}"
	t="${t%.csv*}"
	# t="${t%.sample.csv*}"

	r="$(wc -l "$f")"; r="${r%% *}"
	echo "$r rows"

	mkdir -p "$d/load-duckdb"
	echo "copy \"$t\" from '$PWD/$f' WITH (HEADER 1, DELIMITER '|', NULLSTR 'null');" \
	> "$d/load-duckdb/$t.sql"
done

echo "$(date) done"
