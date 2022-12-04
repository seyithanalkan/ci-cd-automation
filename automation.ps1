$my_aws_key = Read-Host "Enter your AWS Key "
$my_secret_key = Read-Host "Enter your AWS Secret "
(Get-Content -path .\ec2-secret.sh -Raw) -replace 'line2',"export AWS_ACCESS_KEY_ID=$my_aws_key" | Set-Content .\ec2-secret.sh
(Get-Content -path .\ec2-secret.sh -Raw) -replace 'line3',"export AWS_SECRET_ACCESS_KEY=$my_secret_key" | Set-Content .\ec2-secret.sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
chocolatey install awscli --force -y
$Env:AWS_ACCESS_KEY_ID=$my_aws_key
$Env:AWS_SECRET_ACCESS_KEY=$my_secret_key
chocolatey install terraform --force -y
terraform init
terraform plan
terraform apply -auto-approve