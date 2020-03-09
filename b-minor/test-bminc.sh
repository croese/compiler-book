#! /bin/bash

if ! [[ -x bminc ]]; then
    echo "bminc executable does not exist"
    exit 1
fi

../tester/run-tests.sh $*


