#!/bin/bash


## NOTE: this can over-do it, especially with similar domain names.

FIRST='/tmp/public-block-domains.txt'
curl -s https://easylist.to/easylist/easylist.txt > $FIRST
curl -s https://easylist.to/easylist/easyprivacy.txt >> $FIRST

sed -n '/^||/p' -i $FIRST
sed -n '/\^$/p' -i $FIRST
sort -o $FIRST $FIRST

SECOND=`mktemp`
uniq $FIRST > $SECOND
mv $SECOND $FIRST

echo $FIRST
