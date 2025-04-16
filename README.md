## 🙌 Made with 💻 + ❤️ by the Team
Title: Two-Tier web application automation with Terraform, Ansible and GitHub Actions

Course: ACS 730 Cloud Automation and Control Systems
Section: Winter 2025 Cloud Architecture and Administration(CAA)
Professor: Dhana Karuppusamy
Date: April 15, 2025

This project was created with passion, collaboration, and dedication by:

- **Jasleen Kaur**
- **Michael Madukairo**
- **Anju Adhikari**
- **Aftab Khan**

> _“Alone we can do so little, together we can do so much.”_ – **Helen Keller**

Description: The scope of this Final Project for ACS730, is to create a Terraform configuration file and architecture to provision 6 Virtual machines across 4 Public and 2 Private Subnets in different availability zones. The virtual machines will include 5 webservers and a Bastion Host. The first two Virtual Machines will be attached to an Application Load Balancer ALB and will be associated with an Auto Scaling Group, which will expand the instances according to the resource demand.
Two route tables will be created to route traffic to the Internet Gateway for the Public Subnets and a NAT Gateway for the Private Subnets.
in this project we will make use of the AWS Cloud9 environment for Terraform config files and to host the Ansible playbook files.

---

# 🚀 Infrastructure Setup with Terraform + Ansible

This project uses **Terraform** to provision AWS resources (like EC2, S3, ALB, and Bastion host) and **Ansible** to configure Apache web servers that serve a webpage with an image hosted in S3 and the server's hostname/IP.

---

## 📦 Prerequisites

- AWS CLI configured
- Terraform installed
- Ansible installed with `boto3` and `botocore`
- SSH key generated (see below)

---

## 🪣 Step 1: Create an S3 Bucket and Upload Image

create bucket s3://aftab-is-pheonix
upload image ilovecats.jpg and give the required permission for ec2 instances to access

---

## 🛠️ Step 2: Generate SSH Key

```bash
cd Project
ssh-keygen -t rsa -f ./my_key
chmod 400 my_key.pub
```

---

## 🌐 Step 3: Terraform — Infrastructure Provision

```bash
terraform init
terraform validate
terraform apply
```

---

## 🤖 Step 4: Ansible — Apache Setup + Webpage

```bash
cd ansible-project
ansible-inventory -i inventory/aws_ec2.yaml --graph
ansible-playbook -i inventory/aws_ec2.yaml webserver_setup.yaml -u ec2-user --private-key ~/.ssh/my_key
```

---

## ✅ Step 5: Validation

- Go to the ALB public DNS output (from Terraform) in your browser. You should see:
- An image loaded from S3
- The message: "Hello from Jasleen, Mykel, Anju, Aftab"
- Hostname/IP of the instance

*Validate VM3 and VM4 (Web Servers)*

```bash
# Copy private key to Bastion
scp -i my_key my_key ec2-user@<bastion-ip>:~/

# SSH into Bastion
ssh ec2-user@<bastion-ip> -i ./my_key

# From Bastion, SSH or curl to private instances
curl http://<private-ip-of-vm3>
curl http://<private-ip-of-vm4>
```

---

## 🧹 Step 6: Destroy Infrastructure

```bash
terraform destroy

About This Project
This project was completed by a collaborative effort of all team members as outlined at the outset, as a product of extensive brainstorming, research and exhaustive learning, some of the challenges encountered can be summarized as below.  
Challenges:
Deploying infrastructure with terraform config Files: debugging the many errors resulting from syntax mismatch while developing the various modules required to develop the ec2 infrastructure

Applying Ansible Playbook: creating a yml code to deploy ansible play book was initially very challenging we used the examples on the class activities to over come the changes and were able to install Ansible on the cloud9 ide and run the playbook

GitHub Actions: one of the greatest learnings and challenges of this project was uploading the Terraform codes from Cloud9 to GitHub and establishing the GitHub Actions to automate the workflow. We eventually used great help from Professor Dhana who gave us a clear direction on how to achieve this very important step.

Conclusion: this project has played a vital role in exposing us to the great provisions of Cloud Automation using Infrastructure as a code (IaaC) and the extensible learning of Git and GitHub Actions.

```

