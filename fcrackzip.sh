#!/bin/bash

for file in *.zip;
do
    unz=$(fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt "${file}"| awk '{print $5}' )
    echo "${unz}"
    if [ -n  "${unz}" ]
    then
        unzip -P $unz "${file}" -d `echo "$file" | cut -f 1 -d "."`
    else
        echo "no password for the file "$file"" 
    fi
done
