# Create container in Azure storage account for terraform backend remote state file

create a container `tfstatefiles` in the storage account `terraformbackend23521` for the remote backend state file to work


Goto the terminal run init command

```
terraform init
```

dev.state file should be created.


### Install terraform pulgin for Azure DevOps CI/CD
Search 'azure devops marketplace' in google and find market place link or click the below link

https://marketplace.visualstudio.com/search?term=terraform&target=AzureDevOps&category=All%20categories&sortBy=Relevance

You need to choose this particular pulgin provided by Microsoft, not the one provided by others.

Use this below link to install the pulgin into you Azure DevOps project
https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks









