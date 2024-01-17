#!/bin/bash

# Takes random files from the folder lyrics and posts
# their content to the nats topic lyrics

# The NATS client uses the currently chosen context

while :
do
    find lyrics -type f | shuf -n 1 | xargs cat | nats publish lyrics
    sleep 3
done