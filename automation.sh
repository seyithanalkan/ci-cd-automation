#!/bin/bash
source secret.sh
sed -i "s|line2|export AWS_ACCESS_KEY_ID=$my_aws_key|g" ec2-secret.sh
sed -i "s|line3|export AWS_SECRET_ACCESS_KEY=$my_secret_key|g" ec2-secret.sh
apt-get update -y
apt-get install awscli -y
source ec2-secret.sh
aws configure set AWS_ACCESS_KEY_ID $my_aws_key
aws configure set AWS_SECRET_ACCESS_KEY $my_secret_key
aws configure set region "eu-central-1" 
aws configure set output "json" 
aws configure list
apt-get install wget curl unzip software-properties-common gnupg2 -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update -y
apt-get install terraform -y
 terraform -v
 terraform init
 #terraform plan
 terraform apply -auto-approve 



