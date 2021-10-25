<<<<<<< HEAD
#!/bin/bash

VERSAO=$(git describe --tags $(git rev-list --tags --max-count=1))

cd /terraform
RESOURCE_ID=$(/home/ubuntu/terraform output | grep resource_id | awk '{print $2;exit}' | sed -e "s/\",//g")

cd ../terraform-ami
/home/ubuntu/terraform init
TF_VAR_versao=$VERSAO TF_VAR_resource_id=$RESOURCE_ID /home/ubuntu/terraform apply -auto-approve
=======
#!/bin/bash

VERSAO=$(git describe --tags $(git rev-list --tags --max-count=1))

cd /terraform
RESOURCE_ID=$(/home/ubuntu/terraform output | grep resource_id | awk '{print $2;exit}' | sed -e "s/\",//g")

cd terraform-ami
/home/ubuntu/terraform init
TF_VAR_versao=$VERSAO TF_VAR_resource_id=$RESOURCE_ID /home/ubuntu/terraform apply -auto-approve
>>>>>>> 981c7aa4b4e3b83cc1083b080c98291dd4c070f4
