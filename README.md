# Terraform Beginner Bootcamp 2023

# Semantic Versioning
This project is going to make use of semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format  
**MAJOR.MINOR.PATCH**, e.g `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
## Terraform CLI Installation and Refactoring

### Consideration for Linux Distributon
This project is built against Ubuntu. please consider checking your linux distribution and change accordingly to distribution needs.
Use the command `cat /etc/os-release` to check.
A response similar to this will appear.
```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Install the Terraform CLI
The terraform CLI installation instructions have changed due to gpg keyring changes. so we needed to write a bash script [./bin/install_terraform_cli](./bin/install_terraform_cli) referenced in the link below is the latest installation instructions via Terraform Documentation used to write this script. 
[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- This will keep the Gitpod Task File [.gitpod.yml](.gitpod.yml) tidy.
- This allows for easier debugging and manual execution.
- This allows for portability of other projects that need to install Terraform CLI. 

### Shebang
A shebang tells the bash script what program will interpret the script. It is written as the heading of the [./bin/install_terraform_cli](./bin/install_terraform_cli) file. Use `#!/usr/bin/env-bash` . However if you get the error prompt  ```/usr/bin/env-bash: bad interpreter: No such file or directory``` Then use this as your heading instead `#!/bin/bash` .

To run the bash script use the command ```$ source ./bin/install_terraform_cli```

#### Linux Permission Considerations
We need to upgrade the permissions level to make the file executable at the user mode.

```sh
$ chmod u+x ./bin/install_terraform_cli
``` 
alternatively

```sh
$ chmod 744 ./bin/install_terraform_cli
``` 

[Read more on linux permissions here](https://medium.com/@humbleCoder007/chmod-777-72f83198a264#:~:text=The%20%60chmod%20777%60%20command%20is%20used%20in%20Unix%2Dbased,the%20permissions%20to%20be%20set.)

### Github lifecycle command (Before Init command )

We need to be careful when using the init comman. It will not run if we restart the working environment, so we use the before. Refer to link below.

[Read more on Github lifecycle commands here](https://www.gitpod.io/docs/configure/workspaces/tasks)


## Working With Enviromental Variables


### Env Commands (e.g., `grep`):

We list all Environment Variables (Env Vars), using the `env` command. 
To filter specific Env Vars, such as those containing gitpod use grep with the env command."
Example: `env | grep gitpod`

### Setting and Unsetting Env Vars:

We can set an Env Var using  the `export` command followed by the variable name and value. To unset, use the `unset` command."

Example to set: `export MY_VAR=123`
Example to unset: `unset MY_VAR`

We can set an env var temporarily when just running a command 
```sh
Hello=`World` ./bin/print_message
```
Within a bash scrtipt we can set env without writing export.

```sh
#!/usr/bin/env-bash

Hello=`World`

echo $Hello
```

### Printing Environment Variables

WE can print the value of an Env Var, like 'HOME,' using the echo command with the variable name prefixed by a dollar sign."
Example: echo $HOME

### Scoping of Environment Variables:

Env Vars are limited to the scope of the current terminal session and do not persist between different sessions.

### Persistency of Environment Variables in Gitpod:

In Gitpod, set persistent Env Vars in the workspace configuration,
 ```
 gp env Hello=`World`
 ``` 
 They will remain across workspace for all bash terminal restarts.
 You can also set env vars in the .gitpod.yml file but this can only be non sensitive info

 ## AWS CLI Installation and Refactoring

 AWS CLI is installed for the project via the bash script [./bin/install_aws_cli](./bin/install_aws_cli)
 Confirm for the latest version of AWS CLI.
[Install latest version of AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

To check if credentials have been configured correctly use the `aws sts get-caller-identity`. 
This command retrieves information about the AWS identity of the caller, including the AWS account ID, IAM user or role name, and the AWS region.
It provides a quick way to verify the identity and permissions of the AWS entity making the request.

```sh
aws sts get-caller-identity 
```
If successfull it will show a prompt similar to this 

```json
{
    "UserId": "AIDAXQCIWEFELLIDJM7CG",
    "Account": "515548520776",
    "Arn": "arn:aws:iam::515548520776:user/suleiman"
}
```
We'll neeed to generate AWS CLI credentials from IAM user.

## Terraform Basics

### Terraform Registry
Terraform Registry, hosted at [terraform.io](https://registry.terraform.io/) is the official repository for Terraform providers, modules, and other community-contributed infrastructure as code (IaC) components.
- **Providers** Is an interface to the APIs that will allow to create resources in terraform.They enable Terraform to manage resources on these platforms by exposing resource types and configurations.
- **Modules**  are reusable units of infrastructure code that encapsulate a set of related resources and configurations. They simplify IaC development by promoting modularity and reusability, making it easier to create and share infrastructure components.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)

### Terraform console
We can see a list of all the Terraform commands by typing `terraform`

#### Terraform Init
`terraform init` initializes a Terraform project by downloading required provider plugins and modules specified in the configuration. It prepares the working directory for Terraform operations.

#### Terraform Plan
`terraform plan` examines the current state of infrastructure defined in Terraform configurations and generates an execution plan that shows what changes will be made.

#### Terraform Apply
`terraform apply` executes the planned changes outlined in the execution plan generated by `terraform plan`. It applies modifications to the target infrastructure, creating, updating, or deleting resources as necessary based on the configuration. you can automatically approve and avoid the prompt that follows the apply command with `terraform apply --auto-approve`.

#### Terraform Destroy 
`terraform destroy` destroys the resources created on the infrastructure. You can also add use
the `terraform destroy --auto-approve` to complete without a prompt.

#### Terraform Lock Files
`.terraform.lock.hcl` contains specific versions of provider dependencies to ensure Terraform runs consistently across teams and environments.
This file **should be committed** to your version control system (VSC) e.g Github

#### Terraform State Files
`terraform.tfstate` stores the current state of managed infrastructure. 
This file **should not be committed** to your version control system (VSC) as it may contain sensitive data. losing it means you lose the state of your infrastructure.  
`terraform.tfstate.backup` is the previous state of your file state.

#### Terraform Directory
`.terraform` directory containsbinaries of terraform providers.
This file **should not be committed** to your version control system (VSC).

#### Rules for Creating S3 bucket
The rules for creating bucket include lower case = true, upper case = false etc. This had to be set in the resource block `resource "random_string" "bucket_name" ` .
[S3 bucket Naming Rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)