# tf-cmd
terraform useful commands and scripts

# terraform init
to intialize your new terrafrom configuration file

# terraform get   (use it if you are using new modules)
to get the modules that are defined in your terraform configuration file

# terraform apply
to apply the changes to your infrastructure

# terraform destroy
to destroy the changes to your infrastructure

# terraform plan
to plan the changes to your infrastructure

# terraform show
to show the changes to your infrastructure

# terraform validate
to validate the changes to your infrastructure

# terraform fmt
to format the changes to your infrastructure

# terraform taint
to taint the changes to your infrastructure "to force a resource to be destroyed and recreated on the next apply"

# terraform state
to state the changes to your infrastructure

* there is a difference between explicit and implicit dependencies in terraform
- the explicit dependencies are the dependencies that are defined in the terraform configuration file 
e.g create a resource and then create another resource that depends on the first resource

- the implicit dependencies are the dependencies that are not defined in the terraform configuration file 
e.g create a resource and then create another resource that depends on the first resource but the second resource is not defined in the terraform configuration file

# Define root input variables (regular variables)
e.g: variable "project_id" {
  description = "The project ID to host the network in"
  default     = "FILL IN YOUR PROJECT ID HERE"
}

# Define root output values ( access them via module.<MODULE NAME>.<OUTPUT NAME> )
e.g: output "project_id" {
  value       = module.test-vpc-module.project_id
  description = "VPC project id"
}

