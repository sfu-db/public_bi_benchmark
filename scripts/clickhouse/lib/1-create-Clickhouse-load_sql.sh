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
		# echo "copy $r offset 1 records into \"$t\" from '$PWD/$f' delimiters '|','\\n','' null as 'null' locked;" \
		echo "copy $r offset 1 records into \"$t\" from '$PWD/$f' delimiters '|','\\n','' null as 'null';" \
		> "$d/load-clickhouse/$t.sql"
	done
done

echo "$(date) done"
