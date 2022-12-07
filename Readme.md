# End-to-End CI/CD with Terraform - Docker - Jenkins

- **Terraform** creates infra on AWS(**VPC, EC2 instance for Jenkins, Elastic Beanstalk, ECR, S3 bucket, IAM policy**, etc...)
- AWS **User Data script builds and runs a Docker image** in EC2 Instance for **Jenkins Tool**.
- **Jenkins server** is configured via some scripts **without GUI**.(username: admin, password: admin, seed job, trigger: 5 min)
- **Seed job** in Jenkins builds a **React application**, uploads to **ECR repository** and deploys to **Elastic Beanstalk Environment**.
- Terraform gives us the **IP address** of **Jenkins Server** and Elastic Beanstalk **endpoint URL** as an output. 
- **Jenkins Server** is accessible from port **8080** (**username: admin ,  password: admin**)
- **React application** is accessible from **endpoint URL**.
- These steps take approximately **10-15 minutes**.


## Installation

**AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are required with AdministratorAccess policy**

Clone the repository then run the appropriate script for your operating system. **If you have an operating system other than the following, you can use the package manager by changing it in automation script.** (apt install terraform --> yum install awscli)
### Ubuntu
```bash
git clone https://github.com/seyithanalkan/ci-cd-automation.git
cd ci-cd-automation
sudo chmod u+x automation.sh
sudo ./automation.sh
```
### Windows (Powershell run as Administrator)
```powershell
git clone https://github.com/seyithanalkan/ci-cd-automation.git
cd ci-cd-automation
Set-ExecutionPolicy Bypass -Scope Process -Force; .\automation.ps1
```
### Macbook
```bash
git clone https://github.com/seyithanalkan/ci-cd-automation.git
cd ci-cd-automation
sudo chmod u+x automation.sh
sudo ./mac_automation.sh
```


## Uninstall
Please run the following command.

**terraform destroy -auto-approve**

