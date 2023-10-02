# Terraform Beginner Bootcamp 2023 - Week 1




## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal, they can be non-sensitive e.g AWS deault region or sensitive eg. AWS Secret Acceess Keys.

- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the terraform.tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag
We can use the `var-file` flag to specify a file from which to read input variable values. This can be useful when you have a set of variable values that you want to keep separate from your main Terraform configuration.
```sh
terraform apply -var-file=my-variables.tfvars
```
Here, the name of the file is `my-variables.tfvarst`

### terraform.tvfars

This is the default file to load in terraform variables in a block.
```sh
# terraform.tfvars
variable_name = "value"
another_variable = 42

```

### auto.tfvars

In Terraform, `auto.tfvars` is automatically loaded by Terraform itself, and it provides default values for variables. Terraform automatically looks for a file named auto.tfvars in the current working directory and loads its content to set default values for variables in your Terraform configuration.

### order of terraform variables
In Terraform, the order of variable definitions doesn't matter. Terraform dynamically resolves dependencies and evaluates variable values during the planning phase.

While order generally doesn't matter, it's good practice to organize your Terraform files in a clear and readable way, grouping related resources and variables logically for easier maintenance.

## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.
