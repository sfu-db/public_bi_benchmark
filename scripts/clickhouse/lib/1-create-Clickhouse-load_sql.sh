#!/bin/bash

# create SQL load scripts for Clickhouse
# using COPY INTO statements
# count of rows of CSV file

for d in */
do
	d="${d%/}"
	for f in "$d"/*.ch.csv
	do
		echo "$(date) $f"

		t="${f##*/}"
		t="${t%.ch.csv*}"
		# t="${t%.sample.csv*}"

		r="$(wc -l "$f")"; r="${r%% *}"
		echo "$r rows"

		mkdir -p "$d/load-clickhouse"
		echo "SET format_csv_delimiter = '|'; SET format_csv_null_representation = 'null'; SET format_csv_allow_single_quotes = 'false';  SET format_csv_allow_double_quotes = 'false'; INSERT INTO \"$t\" FROM INFILE '$PWD/$f' FORMAT CSV;" \
		> "$d/load-clickhouse/$t.sql"
	done
done

echo "$(date) done"
