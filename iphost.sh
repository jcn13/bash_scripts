#!/bin/sh

#wget without saving to a file
index=$(wget -O- $1 &> /dev/null)

domain=$(echo $1 | cut -d "." -f 2)

#get links from index
links=$(echo $index | grep -o "[^/]*\.$domain\.com" | sort -u)

#one link per line
domains=$(echo $links | tr " " "\n")

#creating file with ips
for i in $domains
do
        ip=$(host $i | cut -d " " -f 4)
        echo $ip >> list_ip_$domain.txt
        printf 'Domain: %25s | ip: %s\n' $i $ip
done
