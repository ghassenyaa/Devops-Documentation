#Download the SonarScanner package by running the command:
#!/bin/sh
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip

unzip sonar-scanner-cli-4.8.0.2856-linux.zip

sudo mv sonar-scanner-cli-4.8.0.2856-linux /opt/sonar-scanner

ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner