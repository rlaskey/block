#!/bin/bash


## NOTE: this can over-do it, especially with similar domain names.

__DIR__=$(dirname $0)
FILE="$__DIR__/block.txt"
TMP='/tmp'
FOUND="$TMP/found.txt"
NOT_FOUND="$TMP/not-found.txt"

> $NOT_FOUND
for i in `grep '^||' $FILE | sed -e 's/^||//g' -e 's/\^.*//g' | sort | uniq`; \
    do grep $i $FOUND > /dev/null || echo $i >> $NOT_FOUND; \
done

for i in `cat $NOT_FOUND`; do sed -i "/.*$i.*/d" block.txt; done
