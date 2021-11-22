# commands

doctl compute ssh-key create sublimee-key --public-key "$(cat ~/.ssh/id_rsa.pub)"

doctl compute ssh-key list

doctl vpcs list

terraform plan -var-file="terraform.tfvars.sample"

terraform apply -var-file="terraform.tfvars"
