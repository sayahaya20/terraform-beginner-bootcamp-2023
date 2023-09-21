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
https://medium.com/@humbleCoder007/chmod-777-72f83198a264#:~:text=The%20%60chmod%20777%60%20command%20is%20used%20in%20Unix%2Dbased,the%20permissions%20to%20be%20set.

### Github lifecycle command (Before Init command )

We need to be careful when using the init comman. It will not run if we restart the working environment, so we use the before. Refer to link below.

https://www.gitpod.io/docs/configure/workspaces/tasks



