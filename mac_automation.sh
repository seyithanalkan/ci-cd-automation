#!/bin/bash
source secret.sh
sed -i '' "s/line2/export AWS_ACCESS_KEY_ID=$my_aws_key/" ec2-secret.sh
sed -i '' "s/line3/export AWS_SECRET_ACCESS_KEY=$my_secret_key/" ec2-secret.sh
brew install awscli 
source ec2-secret.sh
aws configure set AWS_ACCESS_KEY_ID $my_aws_key
aws configure set AWS_SECRET_ACCESS_KEY $my_secret_key
aws configure set region "eu-central-1" 
aws configure set output "json" 
aws configure list
brew install terraform
terraform -v
terraform init
terraform plan
terraform apply -auto-approve 
