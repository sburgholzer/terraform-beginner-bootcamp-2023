# Terraform Beginner Bootcamp 2023 - Week 0

## Root Module Structure

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

Our root module structure is as follows:


```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

## Terraform and Input Variables

### Terraform Cloud Variables

In Terraform we can set two kinds of variables:
- Environment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

This sets values for potentially many input variables declared in the root module of the configuration. The file is a .tfvars file. We would use this option multiple times to include values from more than one file.


### terraform.tvfars

This is the default file to load in terraform variables in blunk

### auto.tfvars

Will use this automatically when running terraform plan or terraform apply

### order of terraform variables

- Any `-var` and `-var-file` options on the command line, in the order they are provided. This overrides all other variable loading methods.
- Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their file names. This overrides terraform.tfvars.json, terraform.tfvars and env vars
- terraform.tfvars.json. This overrides terraform.tfvars and env vars
- terraform.tfvars. This overrides env vars
- env vars. These are overriden by everything else

![image8-2](https://github.com/sburgholzer/terraform-beginner-bootcamp-2023/assets/21959408/2668ca8d-e40b-4bff-8a49-68dac14bb6c3)

[Image from Omkar Birade at spacelift] (https://spacelift.io/blog/terraform-tfvars)
