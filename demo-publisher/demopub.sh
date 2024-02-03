#!/bin/bash

# Takes random files from the folder lyrics and posts
# their content to the nats topic lyrics

# The NATS client uses the currently chosen context

GREEN='\e[0;32m'
GRAY='\e[0;30m'
NC='\e[0m'

while :
do
    FILENAME="$(find lyrics -type f | shuf -n 1)"
    
    printf  "${GREEN}New Song:"
    head -n1 $FILENAME 
    printf $GRAY
    
    # publish to NATS
    cat $FILENAME | nats publish lyrics
  
    printf $NC
    sleep 3
done