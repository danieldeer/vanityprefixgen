#!/bin/bash


usage="$(basename "$0") [-i] inputfile [-o] outputfile -- Generate a BTC vanity address pattern list from any wordlist!

where:
    -i  input wordlist
    -o  output file"


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

rm temp tempLowercase tempFirstLetterUppercase 
#make all lines lowercase
sed 's/.*/\L&/g' $INPUTFILE > tempLowercase

#now make first character of each line uppercase and store in another temp file
sed 's/./\u&/' tempLowercase > tempFirstLetterUppercase

#append firstLetterUppercase file to the lowercase file
cat tempFirstLetterUppercase >> tempLowercase

#Prepend the prefix '1' specific to BTC public addresses to each line
sed -e 's/^/1/' tempLowercase > temp

#From inputfile: remove all lines with invalid characters and store in temp file
sed -E '/l|I|O|0/d' temp > $OUTPUTFILE

#remove temporary files
rm temp tempLowercase tempFirstLetterUppercase




