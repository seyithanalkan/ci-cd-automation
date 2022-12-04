#!/bin/bash
sudo -i

aws configure list
apt-get update && apt-get upgrade
apt-get install lsb-release
apt-get install curl   
apt-get install gnupg -y
apt-get lsb-release -y
    
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

systemctl enable docker
systemctl start docker
chown root:root /tmp/ec2-secret.sh
chmod u+x /tmp/ec2-secret.sh
source /tmp/ec2-secret.sh
apt-get install docker.io -y
apt-get install awscli -y
aws configure set AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
aws configure set AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
aws configure set region "eu-central-1" 
aws configure set output "json" 
aws configure list
cd /home
git clone https://github.com/seyithanalkan/ci-cd-automation.git
cd /home/ci-cd-automation/Jenkins
sudo docker pull jenkins/jenkins:latest
sudo docker build -t jenkins:custumJenkins .
sudo docker run -dit --name jenkins --rm -p 8080:8080  -v /var/run/docker.sock:/var/run/docker.sock -v /root/.aws/config:/root/.aws/config --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=admin   jenkins:custumJenkins
