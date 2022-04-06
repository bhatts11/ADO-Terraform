# **Deploy Azure DevOps resources using Terraform.**
## This terraform code will help you deploy Azure DevOps resources with the help of Terraform:

### **Assumptions in the deployment :**

1. You have already created an ADO organization. The project will be deployed in an existing organization. 
2. Your account has existing PAT with required permissions or you can create a new PAT.
3. Terraform will use PAT to authenticate and create resources in the ADO Organization. This is updated in main.tf file under provider section.

### **Explanation**

Since Terraform documentation for azure devops provider isn't detailed and leave a lot to imagination, I can't use conditionals in the variables. This is because we don't know what all values it expects. If you have seen my previous articles, you would know I am a big fan of parameterizing the code and using variables. I have used variables for the values that I could. And all these variable values can be updated in the terraform.tfvars file. List of resources created as part of this deployment :

1. Azure DevOps project, this is declared under ***main.tf*** file.
2. Azure DevOps Repository, this is declared under ***repository.tf*** file. As part of the process we are also importing it from a sample GitHub repository.
3. Azure DevOps build pipeline created under this project, this is declared under ***main.tf*** file. I have also used yaml file for the build. This code expects this yaml file to exist on the GitHub repository. You can find a sample yaml file in the GitHub repo used in second step.
4. All the variables are declared in ***variables.tf*** file. If you plan on using additional variables, update the values in this file.
5. When we run terraform plan, it fetches the value of these variables from ***terraform.tfvars*** file. Change the values in this file to suit your need.


### **Usage :**

To run this example, simply follow to steps below:

1. Navigate to folder where you stored these files and use :

``` 
  terraform init
  terraform plan
  terraform apply

```
### **Explanation :**

1. Terraform init -> It initializes the directory and downloads required provider along with configuring the module.
2. Terraform plan -> This helps you verify the code is going to deploy the resources as expected. This also ensures we don't face any unwanted surprise. This isn't mandatory, but a recommended step.
3. Terraform apply -> This step applies the resources specified in this code. This will ask you to approve this later. We can skip manual approval by using --auto-approve parameter.

### **Best Practices & Recommendations**

1. Use Terraform workspaces for easier management of the deployments. This can also help us manage Dev, UAT and Production deployments instead of creating multiple state files\directories.
2. If you are creating new resources\variables. Ensure naming convention is easily relatable, since we have a lot of variables in this code.
3. Use conditionals to avoid unwanted surprises.
