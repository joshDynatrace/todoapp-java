#!/bin/bash

sudo apt update -y

sudo apt-get install -y git

sudo apt install -y default-jdk

sudo apt-get install curl unzip -y

wget https://services.gradle.org/distributions/gradle-9.0.0-all.zip
unzip gradle-9.0.0-all.zip
sudo mv gradle-9.0.0 /opt/gradle
echo "export PATH=/opt/gradle/bin:${PATH}" | sudo tee /etc/profile.d/gradle.sh
sudo chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh

git clone https://github.com/joshDynatrace/todoapp-java
cd todoapp-java
