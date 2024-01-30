#!/bin/bash

# Takes random files from the folder lyrics and posts
# their content to the nats topic lyrics

# The NATS client uses the currently chosen context

while :
do
    FILENAME="$(find lyrics -type f | shuf -n 1)"
    
    # publish to NATS (variant 1)
    cat $FILENAME | nats publish lyrics
  
    sleep 3
done