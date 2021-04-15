#!/bin/bash
for f in IN_FILES/*; do
 ./eecc.sh "$f" $1
done
