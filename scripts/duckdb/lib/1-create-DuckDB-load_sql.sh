#!/bin/bash

# create SQL load scripts for DuckDB
# using COPY INTO statements
# count of rows of CSV file

for d in */
do
	d="${d%/}"
	for f in "$d"/*.csv
	do
		echo "$(date) $f"

		t="${f##*/}"
		t="${t%.csv*}"
		# t="${t%.sample.csv*}"

		r="$(wc -l "$f")"; r="${r%% *}"
		echo "$r rows"

		mkdir -p "$d/load-duckdb"
		echo "copy \"$t\" from '$PWD/$f' WITH (HEADER 1, DELIMITER '|', QUOTE '');" \
		> "$d/load-duckdb/$t.sql"
	done
done

echo "$(date) done"
