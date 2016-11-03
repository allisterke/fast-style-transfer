#!/bin/bash

if [[ $# -ne 3 ]]; then
 	echo "usage: $0 checkpoint in-path out-path"
	exit 1
fi

python evaluate.py --checkpoint "$1" --in-path "$2" --out-path "$3"
