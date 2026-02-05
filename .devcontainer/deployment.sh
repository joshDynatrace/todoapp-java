#!/bin/bash

# Build the todoapp
docker build -t tutorial-java-workshop ../.

# Run the todo app
docker run -p 8080:8080 tutorial-java-workshop

# install the Dynatrace agent

# forward all traffic to 8080 on the local machine
# nohup kubectl port-forward deployment/frontend 8080:8080 &
