#!/bin/bash

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -o|--o)
    OUTPUTFILE="$2"
    shift # past argument
    shift # past value
    ;;
    -i|--input)
    INPUTFILE="$2"
    shift # past argument
    shift # past value
    ;; 
esac
done

echo "Out: $OUTPUTFILE"
echo "In: $INPUTFILE"
