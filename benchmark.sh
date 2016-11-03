#!/bin/bash

IN="$1"

if [[ -z $IN ]]; then
	echo "usage: $0 test-image"
	exit 1
fi

#OUT=$(mktemp -d)
OUT=out

for MODEL in models/*; do
	for ((i=2000; i<5000; i+=100)); do
		SIZE=${i}x${i}
		RNAME="$OUT/$SIZE-$IN"
		OUTNAME="$OUT/$SIZE-$(echo $MODEL | tr '/' '-')-$IN"

		convert "$IN" -resize $SIZE $RNAME
		./evaluate.sh $MODEL $RNAME $OUTNAME |& grep OUT_OF_MEMORY > /dev/null
		
		if [[ $? -eq 0 ]]; then
			break
		else
			echo "$IN" $SIZE $MODEL fit
		fi
	done
done
