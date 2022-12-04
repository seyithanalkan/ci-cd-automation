FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install openssl ca-certificates \
     && rm /usr/share/ca-certificates/mozilla/DST_Root_CA_X3.crt \
     && update-ca-certificates
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
RUN echo "nameserver 8.8.8.8" > /etc/resolve.conf
COPY casc.yaml /var/jenkins_home/casc.yaml
COPY seedjob.groovy /usr/local/seedjob.groovy
COPY disable-script-security.groovy /var/jenkins_home/init.groovy.d/disable-script-security.groovy
RUN jenkins-plugin-cli --plugins \
ant:latest \
antisamy-markup-formatter:latest \
build-timeout:latest \
cloudbees-folder:latest \
configuration-as-code:latest \
credentials-binding:latest \
email-ext:latest \
git:latest \
github-branch-source:latest \
gradle:latest \
ldap:latest \
mailer:latest \
matrix-auth:latest \ 
pam-auth:latest \
pipeline-github-lib:latest \
pipeline-stage-view:latest \
ssh-slaves:latest \
timestamper:latest \
workflow-aggregator:latest \ 
ws-cleanup:latest \
job-dsl:latest \
blueocean:latest \
authorize-project:latest
COPY build.sh /var/jenkins_home/workspace/seed_job/Jenkins/build.sh
COPY hellow_world_job.groovy /var/jenkins_home/workspace/seed_job/hellow_world_job.groovy
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce -y
RUN usermod -aG docker jenkins
RUN apt install python3 -y
RUN apt install awscli -y 

