#!/bin/bash

n=$1
n_warn=0
n_err=0
n_succ=0

for i in `seq 1 $n`; do
    clj-kondo --parallel --lint src test
    ret=$?
    if [ $ret -eq 3 ]; then
        (( n_err++ ))
    elif [ $ret -eq 2 ]; then
        (( n_warn++ ))
    elif [ $ret -eq 0 ]; then
        (( n_succ++ ))
    fi
done

echo "lint tried $n times. success=$n_succ, warn=$n_warn, error=$n_err"
