# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation intructions have changed due to gpg keyring changes. So needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is built against Ubuntu.
Please consider checking our Linux Distribution and change accordingly to distrubtion needs.

[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:

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

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues noticed that bash scripts steps were a considerable amount more code. So decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allows for an easier debug and excute manually Terraform CLI install.
- This will allow better portability for other projects that need to install Terraform CLI.

#### Shebang Considerations

A Shebang (pronounced Sha-bang) tells the script what program will be interpeting the script. eg. `#!bin/bash`

ChatGPT recomended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions
- will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations
When executing the bash script we can use the `./` shorthad notation to execute the bash script.

eg. `./bin/install_terraform_cli.sh`

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. `source ./bin/install_terraform_cli.sh`

##### Linux Permissions Considerations

In order to make our bash scripts executable we need to change Linux permissions for the file to be executable at the user level.

```sh
chmod u+x ./bin/install_terraform_cli.sh
```

alternatively:
```sh
chmod 744 ./bin/install_terraform_cli.sh
```

https://en.wikipedia.org/wiki/Chmod

### GitPod Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks