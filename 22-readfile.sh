#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# cat "$1" ; it prints the total content in the file (which we give as argument)

# tr -s '[:punct:]' '[:space]' ; tr replaces punctuations and spaces with new lines; -s removes repeated punctutation/space

# tr '[:upper:]' '[:lower:]' ; converts all the words to lower

# grep -v '^$'; doesnot includes empty lines in the next input 

# sort ; sort the list of word alphabetically

# uniq -c ; count how many times the word occured

# sort -nr ; sort (n) numerically (r) in reverse order

# head -n 5 ; to print top 5 words


cat "$1" | tr -s '[:punct:][:space:]' '\n' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 5










