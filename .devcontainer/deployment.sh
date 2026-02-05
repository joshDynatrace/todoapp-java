#!/bin/bash

# Build the todoapp
docker build -t todoapp-java .

# Run the todo app
docker run -p 8080:8080 todoapp-java &

# Download the Dynatrace OneAgent installer
wget -O Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh \
  "https://arn95277.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86" \
  --header="Authorization: Api-Token $DT_API_TOKEN"

# Run the installer
/bin/sh Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh --set-monitoring-mode=discovery --set-app-log-content-access=true

# forward all traffic to 8080 on the local machine
# nohup kubectl port-forward deployment/frontend 8080:8080 &
