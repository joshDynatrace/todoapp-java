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
