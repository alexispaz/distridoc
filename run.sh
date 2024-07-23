#!/bin/bash

tmp=$(mktemp)

for i in $(seq 100); do

	Rscript ttc.r > $i.log

	tail -n 25 $i.log | awk '{print $3}' > $i.sol
	tail -n 51 $i.log | head -n 25 | awk '{print $2}' > $i.top
	paste names $i.sol $i.top | column -t > $i.run
	echo $(sum.awk 3 $i.run) $i.run >> $tmp
done

sort -g $tmp > run

