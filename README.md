# block
Works w/ uBlock, uBlock Origin, etc. Add by URL:

> https://raw.githubusercontent.com/rlaskey/block/main/block.txt

Please submit a PR if any of these sites don't exist anymore.

Simple script to verify that DNS exists for any of the existing entries:

```
for i in $(sed -e '/^$/d' -e '/^[\!\[]/d' -e 's/^||//g' -e 's/[\^\/].*//' block.txt | sort | uniq); do
	host $i > /dev/null || echo $i
done
```
