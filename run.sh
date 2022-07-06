#!/bin/sh
timesleep=43200
if [ "$WAIT" != "" ]; then
    $timesleep = $WAIT
fi
while [ 1 ]
do
    if [ "$TOKEN" = "" ]; then
        echo "Error: You need to provide a github token"
        exit 0
    fi
    if [ "$ORG" != "" ]; then
        github-backup $ORG -P -t $TOKEN -o . --all -O
        echo "Backup completed. Next Backup in $timesleep seconds"
    elif [ "$USER" != "" ]; then
        github-backup $USER -P -t $TOKEN -o . --all
        echo "Backup completed. Next Backup in $timesleep seconds"
    else
        echo "EError: you need to specify a github repository or organization"
        exit 0
    fi
    sleep $timesleep
done
