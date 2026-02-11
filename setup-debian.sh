#!/bin/bash

sudo apt update -y

#install git
sudo apt-get install -y git

# install the JDK
sudo apt install -y default-jdk

# clone the repo
git clone https://github.com/joshDynatrace/todoapp-java
cd todoapp-java

# Run the todo app
./gradlew -i bootJar
java -jar build/libs/tutorial-1.0.0.jar

# Deploy Dynatrace OneAgent
# wget  -O Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh "https://arn95277.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86" --header="Authorization: Api-Token $token"
# sudo /bin/sh Dynatrace-OneAgent-Linux-1.329.73.20260123-140641.sh --set-monitoring-mode=discovery --set-app-log-content-access=true
