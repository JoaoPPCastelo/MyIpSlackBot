![Docker Image CI](https://github.com/JoaoPPCastelo/MyIpSlackBot/workflows/Docker%20Image%20CI/badge.svg)

# Introduction 
Slack bot to check and share a device's public IP on slack. 

On slack, you'll get a message like: 

```
"New IP assigned for HOSTNAME: IP"
```

# Getting Started
To use this docker container, follow the steps:
1.	Clone the git repo to the device you want have the container running.
2.	Go to https://my.slack.com/services/new/incoming-webhook and create a new Incoming WebHooks.
3.	On the docker-compose file:
    +  paste the URL for the incoming webhook on the variable "SLACK_WEBHOOK_URL"
    +  set the name of your hostname on the variable "HOSTNAME". 
    +  provide a timeframe to check for new IPs (default is every minute) on the variable "TIMER"

# Build and Test
It's docker! Just run `docker-compose up -d` and that's it ;-)

# Contribute
Feel free to use and/or change the code. 

