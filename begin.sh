#!/bin/bash

sep=$(printf "=%.0s"  $(seq 1 100))

nmap -p- $1

echo $sep

nikto -h http://$1

echo $sep

dirb http://$1 /usr/share/dirb/wordlists/common.txt
