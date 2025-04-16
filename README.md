## 🙌 Made with 💻 + ❤️ by the Team

This project was created with passion, collaboration, and dedication by:

- **Jasleen Kaur**
- **Mykel**
- **Anju**
- **Aftab Khan**

> _“Alone we can do so little, together we can do so much.”_ – **Helen Keller**

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
```

