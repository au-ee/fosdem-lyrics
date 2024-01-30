#!/bin/bash

# Takes random files from the folder lyrics and posts
# their content to the nats topic lyrics

# The NATS client uses the currently chosen context

while :
do
    FILENAME="$(find lyrics -type f | shuf -n 1)"
    
    # publish to NATS (variant 1)
    cat $FILENAME | nats publish lyrics &

    # publish to MQTT (variant 2)
    cat $FILENAME | mqttx pub -t 'lyrics' -h 'live.fiftysix.site' -p '8883' -l mqtts -u publisher -P $MQTT_PASSWORD -s &

    # wait for both tasks to complete
    wait
  
    sleep 3
done