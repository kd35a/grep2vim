#!/usr/bin/env bash

MATCHES=$(grep -Hnr "$1" .)

i=1
while read line; do
  echo "$i: $line"
  i=$[$i + 1]
done <<< "$MATCHES"

echo -n "Which line do you want to open (or q for quit)? "
read wanted_match

if [ "$wanted_match" == "q" ]; then
  exit 0
fi

if ! [[ $wanted_match != *[!0-9]* ]]; then
  echo "error: not a number, exiting" >&2
  exit 1
fi

line=$(echo "$MATCHES" | sed -n ${wanted_match}p)
IFS=: read filename lineno match <<< "$line"

vim +${lineno} $filename
