## To install the Azure PowerShell module on a Mac, you can follow these steps:

1. Open a terminal on your Mac.
2. Check if you have PowerShell installed by running the command `pwsh`. If PowerShell is not installed, you can install it by following the instructions on the official Microsoft website: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.3

If the brew command isn't found, you need to install Homebrew following their instructions.


```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Now, you can install PowerShell:
```
brew install --cask powershell
```

Finally, verify that your install is working properly:

```
pwsh
```

Once PowerShell is installed, you can install the Azure PowerShell module by running the following
based on the instruction from microsoft website https://learn.microsoft.com/en-us/powershell/azure/install-azps-macos?view=azps-10.0.0

```
Install-Module -Name Az -Repository PSGallery -Force
```

Once its installed, type 

```
az login
```
You will get a prompt to signin to Azure cloud, if you logged in successfully, you will get an output of list of subscription. 

```
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "<homeTenantId>",
    "id": "<your subscription id>",
    "isDefault": false,
    "managedByTenants": [],
    "name": "<your subscription name>",
    "state": "Enabled",
    "tenantId": "<your tenant id>",
    "user": {
      "name": "< your email id>",
      "type": "user"
    }
  },
  {

  },
  {

  }
]
```

Set the subscription id that you need to use using below command
```
az account set --subscription <your subscription id>
```

## To install the Terraform on a Mac, you can follow these steps:

1. Open a terminal on your Mac.
2. You can install it by following the instructions on the official Hashicorp Terraform website: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

First, install the HashiCorp tap, a repository of all our Homebrew packages.

```
brew tap hashicorp/tap
```

Now, install Terraform with hashicorp/tap/terraform.

```
brew install hashicorp/tap/terraform
```

### Verify the installation
Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.

```
terraform -help
```