# Financial-Modeling-App-Moakcasey-Infra


This repository contains the Terraform configuration files for provisioning and managing the infrastructure for the MoakCasey project. The infrastructure includes resources such as Azure Container Registry (ACR), App Services, SQL Server, Static Web Apps, and Storage Accounts, with environment-specific configurations for **development**, **UAT**, and **production** environments.

## Infrastructure Components

The infrastructure is provisioned using Terraform and includes the following Azure resources in the ***resources** folder :

1. **Azure Container Registry (ACR):**  
   Used to store and manage Docker container images for the MoakCasey applications.
   
2. **App Services:**  
   Web hosting services to deploy both the backend and frontend applications.

3. **App Service Plan:**  
   Defines the pricing tier and scaling options for the App Services.

4. **Resource Group:**  
   A logical grouping of all related resources in Azure.

5. **SQL Server & Database:**  
   A SQL Server instance that hosts the database required for backend application functionalities.

6. **Static Web App:**  
   Deploys the frontend application for MoakCasey with content hosted in a globally distributed manner.

7. **Storage Account:**  
   Provides storage for static assets, logs, and any other required data.

---

## Folder Structure

The Terraform code is modular and organized in a way that supports environment-specific deployments:

```bash
modules/
  ├── backend.tf          # Backend configuration (e.g., remote state storage)
  ├── main.tf             # Main configuration file
  ├── output.tf           # Output values for the infrastructure
  ├── variable.tf         # Common variables used across environments
  ├── terraform.tfvars    # Default variable values (can be overridden by environment-specific .tfvars files)
  ├── dev.tfvars          # Variables specific to the development environment (basic/free tier resources)
  ├── uat.tfvars          # Variables specific to the UAT environment (mid-tier resources)
  ├── prod.tfvars         # Variables specific to the production environment (advanced resources)

```


Each environment (development, UAT, and production) has its own `.tfvars` file that contains specific variables, such as resource names, tier levels, and configurations appropriate for that environment.

---

## Prerequisites

How to Configure and Deploy the Infrastructure via Locally

Before deploying the infrastructure using Terraform, ensure that the following prerequisites are met:

1. **Terraform installed:**  
   You can download and install Terraform

2. **Azure CLI installed and authenticated:**  
   Install the Azure CLI and authenticate by running:

   ```bash
   az login

Follow the steps below to configure and deploy the infrastructure for a specific environment:

1. Clone the Repository

    ```bash

    git clone https://github.com/techdome-io/financial-modeling-app-moakcasey-infra.git

    cd financial-modeling-app-moakcasey-infra/modules

2. Initialize Terraform

    Initialize Terraform to download the necessary providers and configure the backend for storing the Terraform state:

    ```bash
    terraform init -var-file="dev.tfvars"

3. Plan the Deployment

    To ensure that the infrastructure plan is correct before applying it, you can run the following command. Be sure to specify the environment you want to target (dev.tfvars, uat.tfvars, or prod.tfvars):

    ```bash
    terraform plan -var-file="dev.tfvars" -out="tfplan"
    ```

    Replace dev.tfvars with uat.tfvars or prod.tfvars as needed.

4. Apply the Configuration

    Once the plan looks good, apply the configuration to create the infrastructure:

    ```bash
    terraform apply --auto-approve tfplan



# GitHub Workflow for Terraform Infrastructure

    This pipeline is located at .github/workflows/DEV-IAC.yml and automates the deployment of the infrastructure defined in the Terraform scripts based on the active branch.

    The workflow ensures that the correct environment (dev, uat, prod) is deployed by using the respective .tfvars file depending on the branch name.

```bash
name: MoakCasey IAC

on:
  push:
    branches:
      - paras/terraform  # Change this to specific branches like dev, uat, prod

jobs:
  setup:
    name: Setup Azure and Terraform
    runs-on: ubuntu-latest
    env:
      ARM_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
      ARM_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
      ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
      ARM_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
      TF_VAR_sql_admin_login: ${{ secrets.SQL_ADMIN_USERNAME }}
      TF_VAR_sql_admin_password: ${{ secrets.SQL_ADMIN_PASSWORD }}
    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Azure CLI
      run: sudo apt-get install azure-cli

    - name: Azure Login
      uses: azure/login@v1
      with:
        creds: ${{ secrets.NEW_AZURE_CREDENTIALS }}

    - name: Install Terraform
      uses: hashicorp/setup-terraform@v2

    - name: Extract branch name
      id: extract_branch
      run: echo "BRANCH_NAME=${GITHUB_REF#refs/heads/}" >> $GITHUB_ENV

    - name: Display branch name
      run: echo "Branch Name: $BRANCH_NAME"

    - name: Terraform Init
      run: terraform init -var-file="${{ env.BRANCH_NAME }}.tfvars"
      working-directory: ./modules
    
    - name: Terraform Validate
      run: terraform validate
      working-directory: ./modules
    
    - name: Terraform Plan
      run: terraform plan -var-file="${{ env.BRANCH_NAME }}.tfvars"
      working-directory: ./modules

    - name: Terraform Apply
      run: terraform apply -auto-approve -var-file="${{ env.BRANCH_NAME }}.tfvars"
      working-directory: ./modules

```

## Running the Pipeline for Different Environments

The pipeline can be run for different branches, and based on the branch name, the correct .tfvars file is selected for that environment:

1. For Development: Push changes to the dev branch.
    The pipeline will automatically use modules/dev.tfvars.

2. For UAT: Push changes to the uat branch.
    The pipeline will automatically use modules/uat.tfvars.

3. For Production: Push changes to the prod branch.
    The pipeline will automatically use modules/prod.tfvars.
