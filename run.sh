#!/bin/sh

IP=127.0.0.1
NEW_IP=127.0.0.1

# If TIMER is not passed as env. variable, set it to 1 minute. I.e., check for a new IP every minute
if [ -z "$TIMER" ]; then
    TIMER=60
fi

if [ -z "$HOSTNAME" ]; then
    HOSTNAME=''
fi

if [ -z "$SLACK_WEBHOOK_URL" ]; then
    echo 'Slack Webhook not defined. Exiting...'
    return 1
fi

# Get current IP
check_ip() {
    NEW_IP=`dig +short myip.opendns.com @resolver1.opendns.com`
}

# Post the new IP to Slack
post_to_slack() {
    IP=$NEW_IP
    echo "New IP assigned: $NEW_IP"
    PAYLOAD="New IP assigned for "$HOSTNAME": "$IP
    curl -X POST $SLACK_WEBHOOK_URL -H "Content-Type: application/json" -d '{ "text":"'"$PAYLOAD"'"}'
}

while [ true ]
do
    check_ip

    if [ "$IP" != "$NEW_IP" ]
    then
        post_to_slack
    fi
    
    sleep $TIMER
done
