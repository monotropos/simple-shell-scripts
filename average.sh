#!/bin/bash

SUM=0
COUNT=0

while [[ "$1" -ne "" ]] ; do
	SUM=$((SUM + $1))
	COUNT=$((COUNT + 1))
	shift
done

echo "sum=$SUM"
echo "count=$COUNT"

A="$(echo "scale=8; $SUM/$COUNT" | bc)"
LC_ALL=C printf 'average=%0.3f\n' "$A"
