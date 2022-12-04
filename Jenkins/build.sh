#!/bin/bash
echo "Automation Master Seyit Han Alkan"

service docker start
docker run --rm -t ubuntu tty
aws configure set region "eu-central-1" 
aws configure set output "json" 
aws configure list
pwd
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 544167776152.dkr.ecr.eu-central-1.amazonaws.com
cd /var/jenkins_home/workspace/seed_job/docker-react
docker build -t react-docker -f Dockerfile .
docker tag react-docker:latest 544167776152.dkr.ecr.eu-central-1.amazonaws.com/react-docker:latest
docker push 544167776152.dkr.ecr.eu-central-1.amazonaws.com/react-docker:latest
echo "DEPLOY STAGE"
aws s3 cp Dockerrun.aws.json s3://seyithan-react/
aws elasticbeanstalk create-application-version --application-name "react-web-aplication" --version-label $BUILD_NUMBER --source-bundle S3Bucket=seyithan-react,S3Key=Dockerrun.aws.json
aws elasticbeanstalk update-environment --application-name "react-web-aplication" --environment-name "react-web-environment" --version-label=1
