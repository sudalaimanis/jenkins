#!/bin/bash

# Download Jenkins key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to sources list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists
sudo apt-get update
sudo apt update

# Install required dependencies
sudo apt install -y fontconfig openjdk-17-jre

# Display Java version
java -version

# Install Jenkins
sudo apt-get install -y jenkins docker.io

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
