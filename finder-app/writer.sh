#!/bin/sh
writefile=$1
writestr=$2
NUM_ARGS=$#

if [ $NUM_ARGS -lt 2 ]
then
  echo "Error: Less than 2 arguments were passed."
  exit 1
fi

dirpath=$(dirname $writefile)
len_dirpath=${#dirpath}

if [ $len_dirpath -gt 0 ]
then
  if [ ! -d $dirpath ];
  then
    mkdir -p $dirpath
  fi
fi

echo $writestr > $writefile
