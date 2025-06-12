#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# it prints the total content in the file (which we give as argument)
cat $1 | \ 

# tr replaces punctuations and spaces with new lines; -s removes repeated punctutation/space
tr -s '[:punct:]' '[:space]' | \ 

# converts all the words to lower
tr '[:upper:]' '[:lower:]' | \ 

# doesnot includes empty lines in the next input
grep -v '^$' | \ 

#sort the list of word alphabetically
sort | \ 

# count how many times the word occured
uniq -c | \ 

# sort (n) numerically (r) in reverse order
sort -nr | \ 

# to print top 5 words
head -n 5 







