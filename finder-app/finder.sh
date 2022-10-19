#!/bin/sh
filesdir=$1
searchdir=$2
NUM_ARGS=$#

if [ $NUM_ARGS -lt 2 ]
then
  echo "Error: Less than 2 arguments were passed."
  exit 1
fi

if [ ! -d $filesdir ]; then
  echo "Error: Directory does not exist in the filesystem."
  exit 1
fi

FILENAMES=$(grep -rl $searchdir $filesdir)
MATCHING_LINES=$(grep -rhc $searchdir $filesdir)

NUM_FILENAMES=0
NUM_MATCHING_LINES=0

for FILENAME in $FILENAMES
do
  NUM_FILENAMES=$(expr $NUM_FILENAMES + 1)
done

for NUM in $MATCHING_LINES
do
  NUM_MATCHING_LINES=$(expr $NUM_MATCHING_LINES + $NUM)
done

echo "The number of files are $NUM_FILENAMES and the number of matching lines are $NUM_MATCHING_LINES."
