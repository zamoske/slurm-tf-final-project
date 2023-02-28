# slurm-tf-final-project
1. Необходимо передать в переменные окружения  yc-token и yc-folder-id
- export YC_TOKEN
- export YC_FOLDER_ID
2. Создание образа, используя packer
- cd packer
- packer build nginx.pkr.hcl
3. Работа с terraform
- cd terraform
- terraform init
- terraform apply -var yc_folder_id=$YC_FOLDER_ID -var yc_token=$YC_TOKEN -var-file var.tfvars --auto-approve
