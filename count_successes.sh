#!/usr/bin/env bash

# Extracts contents of a compressed tar archived specified as
# the first command line argument and count the number of files
# that contain the word "SUCCESS" and the number containing the word
# "FAILURE" and reports that result.

tar_file=$1

SCRATCH=$(mktemp --directory)

tar zxf $tar_file --directory $SCRATCH

num_successes=$(grep -lr SUCCESS $SCRATCH | wc -l)

num_failures=$(grep -lr FAILURE $SCRATCH | wc -l)

echo "There were $num_successes successes and $num_failures failures." 

rm -rf "$SCRATCH"
