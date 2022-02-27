#!/bin/sh

index=$(wget -O- $1 &> /dev/null)

domain=$(echo $1 | cut -d "." -f 2)

links=$(echo $index | grep -o "[^/]*\.$domain\.com" | sort -u)

domains=$(echo $links | tr " " "\n")

for i in $domains
do
        ip=$(host $i | cut -d " " -f 4)
        echo $ip >> list_ip_$domain.txt
        printf 'Domain: %25s | ip: %s\n' $i $ip
done
