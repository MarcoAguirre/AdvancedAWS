# Advanced AWS Practical Exercise
​
This repository provides a basic template for starting the practical exercise related to Advanced AWS module for ioet University 2.0 using LocalStack, a tool that simulates Amazon's cloud services in local environments for development, testing, and learning purposes.
​
## Objective
​
The goal of this repository is to help ioet University 2.0 students test their AWS skills with a local environment where they can practice and experiment with different services of the platform in a controlled environment and without associated costs.
​
## Prerequisites
​
Before using this repository, make sure you have installed:
​
- [Docker](https://www.docker.com/) to run LocalStack in a container.
​
## Usage
​
### Click on use this template to make a copy of this repository on your account, also you should mark it as private and invite this users to your repo:
​
- @Alan1108 (Alan Bermudez)
- @nishedcob (Nicholas Spalding)
- @dsgarcia (Daniel Garcia)
​
### Create localstack and terraform services as containers with the following command.
​
```bash
make services-up
```
​
This will create 2 containers:
​
- Localstack container
- Terraform container
​
So you don't have to install Terraform in your machine
​
### Commands to run and test your infrastructure with LocalStack.
#### Terraform init
Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
​
```bash
make tf-init
```
​
#### Terraform fmt
​
Rewrites all Terraform configuration files to a canonical format. Both configuration files (`.tf`) and variables files (`.tfvars`) are updated. JSON files (`.tf.json` or `.tfvars.json`) are not modified.
​
```bash
make tf-fmt
```
​
#### Terraform plan
​
Generates a speculative execution plan, showing what actions Terraform would take to apply the current configuration. This command will not actually perform the planned actions.
​
```bash
make tf-plan
```
​
#### Terraform apply
​
Creates or updates infrastructure according to Terraform configuration files in the current directory.
​
```bash
make tf-apply
```
​
#### Terraform destroy
​
Deletes all the infrastructure that was created with Terraform
​
```bash
make tf-destroy
```
​
## Repository Structure
​
The repository is structured as follows:
​
- `infrastructure/`: Folder corresponding to the infrastructure that you are going to build. You can create folders for a better organization.
- `app/`: Folder corresponding to a "backend" app that only contains a handler function. You should modify it as needed by your solution.
- `ui/`: Folder corresponding to a frontend app. You can modify it to talk to the backend for extra credit.
- `README.md`: This file with information about the repository and its usage.
​
Each folder may contain code files, scripts, configuration templates, and any resources necessary to complete the corresponding exercise.
​
## Contributions
​
If you wish to contribute to this repository by adding correcting errors, or improving documentation, you are welcome to do so! Feel free to open a pull request to discuss and apply changes. Remember to talk with Nicholas Spalding (@nishedcob) or Gustavo Eguez (@eguezgustavo) first.
​
## Notice
​
This repository is for educational and practice purposes only. Its use in production environments is not recommended, and the proper functioning of exercises in a real AWS environment may require another configurations.
​
## Additional Resources
​
- [AWS Documentation](https://docs.aws.amazon.com/)
- [LocalStack Documentation](https://github.com/localstack/localstack#localstack)
- [Localstack page to monitor and debug the resources](https://app.localstack.cloud/)
​
---
​
Enjoy practicing your AWS skills with LocalStack! If you have any questions or issues, feel free to ask Alan Bermudez, Nicholas Spalding or Daniela Garcia.
