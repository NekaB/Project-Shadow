# Project-Shadow

## **Description:**

This is the Portfolio for Project-Shadow: A DevOps project where I feature the methods I used to create a work environment in AWS, utilizing different instances and resources for the provisioning of code and software to maintain and update a website. The importance of this project is to show my understanding of DevOps capabilities and culture. 

## **Table of Contents:**

###### A. How to Deploy Project-Shadow

###### B. How Jenkins deploys code automatically via the Dev Branch and Head commits:

## A.
**How to Deploy Project-Shadow:**

Step 1: Set up AWS environment using Terraform and Ansible. In order for you to do this, there has to be an AWS account established . This is the environment where your Dev, Prod, Jenkins, and Jump server will be as well as your security groups: employee
and customer. (Note: Create API key to use for Terraform from the AWS.)

**Troubleshooting issues you may encounter: Connectivity issues: when establishing each server, be sure to add the private
URL to your local hosts inventory file. Whenever suggested, Use the default networking constructs. Be sure to use the ssh-keygen
linux command on each server to generate the keys to add to the authorized key file of each server.**

Step 2: Once established, you will use Terraform as infrastructure. The main.tf file in Terraform is what will be used to create 
each machine and the security groups. Terraform has specified code blocks for creating each instance and resource in AWS (Amazon
Web Services). 

Step 3: Once the machines are established, you will then use Ansible to install Apache Web Server on the Dev and Prod machine. 
For Jenkins, you will install the jenkins package on the Jenkins server. Jenkins will be hand-installed, and configured through its 
web portal for performing integration and deployment tasks. (Note: Be sure to put termination protection on the Jenkins machine
either in AWS or as a block in the Terraform main.tf file).

**Suggestions in organizing- Be sure to do ALL the infrastructure with Terraform and deploying of code with Ansible. If there 
are updates needed, adjustments can be made easily. Resist the urge to make adjustments in AWS without committing them to 
Terraform too.**

Step 4: Once the suggested packages are uploaded to the specified servers/machines, then there must be an adjustment made to 
the security groups. The purpose of the Jump machine is for Employees to access the Dev, Prod, and Jenkins machines.
The Dev, Prod, and Jenkins machine will no longer be accessed unless through the Jump server. For this you will establish a 
new security group resource block called "Jump Security". Once done, adjust the security group for the Dev, Prod,
and Jenkins machines by only assigning them the "Jump" security” group. The Jump machine will be the only one assigned the
“Employee Security” group. Use Ansible to insert the private Key of the Jump box, and insert them into the authorized key 
files of the Dev, Prod, and Jenkins machine. 

**Troubleshooting: Be sure to configure the module in Ansible properly by paying close attention to the file path selected. In order to be sure the proper key is installed in the proper remote files.**

## B.

**How Jenkins deploys code automatically via the Dev Branch and Head commits:**

Jenkins is connected to a github account holding the Portfolio- Files needed to update and stage the Dev and Prod browsers. The Github plugin in Jenkins allows a webhook feature to git. When any changes are committed to the Portfolio-files Master or Dev branch, then Jenkins is triggered, and the adjustments
are applied to the suggested server (Dev or Prod) and shown in the browser. 




