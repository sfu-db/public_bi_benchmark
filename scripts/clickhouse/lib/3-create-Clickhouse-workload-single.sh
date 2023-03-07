#!/bin/bash

# create SQL run scripts for DuckDB


d=$1
n=$2
o=$3
echo "" > $o

for f in "$d"/*.sql
do
    echo "" >> $o
    echo "--$f" >> $o
    echo "" >> $o
    for ((i=1; i<=$n; ++i))
    do
        cat $f >> $o
        echo "" >> $o
    done
done

echo "done"