# 🚀 Jenkins CI/CD Pipeline with Terraform on AWS

## 📌 Project Overview

This project demonstrates how to automate **AWS Infrastructure provisioning** using **Terraform** and **Jenkins CI/CD Pipeline**. The pipeline automatically validates, plans, and deploys infrastructure changes to AWS, eliminating manual deployment efforts and enabling Infrastructure as Code (IaC).

The project showcases practical implementation of DevOps practices including:

* Infrastructure as Code (Terraform)
* Continuous Integration & Continuous Deployment (Jenkins)
* AWS Cloud Infrastructure Automation
* Secure Credential Management
* Automated Infrastructure Provisioning

---

## 🏗️ Architecture

```text
                +----------------------+
                |    GitHub Repository |
                +----------+-----------+
                           |
                           | Git Push
                           ▼
                    +--------------+
                    |   Jenkins    |
                    | CI/CD Server |
                    +------+-------+
                           |
      ---------------------------------------------
      |                |                |
      ▼                ▼                ▼
terraform init   terraform plan   terraform apply
                           |
                           ▼
                  AWS Infrastructure
         (EC2, S3, RDS or other resources)

Terraform State
       │
       ├── S3 Bucket
       └── DynamoDB Table (State Locking)
```

---

# 🚀 Tech Stack

| Technology   | Purpose                         |
| ------------ | ------------------------------- |
| Jenkins      | CI/CD Automation                |
| Terraform    | Infrastructure as Code          |
| AWS EC2      | Jenkins Server & Infrastructure |
| AWS IAM      | Authentication & Authorization  |
| Amazon S3    | Remote Terraform State Storage  |
| DynamoDB     | Terraform State Locking         |
| Git & GitHub | Source Code Management          |
| Ubuntu       | Jenkins Host Operating System   |

---

# 📁 Project Structure

```text
.
├── Jenkinsfile
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

---

# ⚙️ Prerequisites

Before starting, ensure the following are available:

* AWS Account
* Ubuntu EC2 Instance
* Jenkins
* Terraform
* Git
* IAM User with required permissions
* S3 Bucket for Terraform State
* DynamoDB Table for State Locking

---

# 🛠️ Step 1 – Launch Jenkins Server

Launch an Ubuntu EC2 instance and install Jenkins.

Update packages:

```bash
sudo apt update
```

Install Java:

```bash
sudo apt install -y openjdk-11-jdk
```

Install Jenkins:

```bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
```

Start Jenkins:

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

Retrieve the Jenkins Admin Password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Open **Port 8080** in the EC2 Security Group and access Jenkins through the browser.

---

# 🔌 Step 2 – Install Jenkins Plugins

Install the following plugins:

* Terraform
* Pipeline
* Git
* AWS Credentials

---

# ☁️ Step 3 – Install Terraform

Download Terraform:

```bash
wget https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_amd64.zip
```

Extract the package:

```bash
unzip terraform_1.7.0_linux_amd64.zip
```

Move the binary:

```bash
sudo mv terraform /usr/local/bin/
```

Verify installation:

```bash
terraform -v
```

---

# 🔐 Step 4 – Configure AWS Credentials

Create an IAM User with appropriate permissions.

Required permissions:

* AmazonS3FullAccess
* AmazonDynamoDBFullAccess
* AdministratorAccess *(recommended only for learning environments)*

Store AWS Access Key and Secret Key securely in Jenkins:

**Manage Jenkins → Manage Credentials**

---

# 🏗️ Step 5 – Create Terraform Configuration

Terraform files used:

* **provider.tf** – AWS Provider Configuration
* **main.tf** – Infrastructure Resources
* **variables.tf** – Input Variables
* **outputs.tf** – Output Values

Initialize Terraform:

```bash
terraform init
```

Validate Configuration:

```bash
terraform validate
```

Generate Execution Plan:

```bash
terraform plan
```

Deploy Infrastructure:

```bash
terraform apply -auto-approve
```

---

# 🔄 Step 6 – Configure Jenkins Pipeline

Create a **Pipeline Job** in Jenkins and configure it to use the project's `Jenkinsfile`.

Pipeline stages:

* Checkout Source Code
* Terraform Init
* Terraform Validate
* Terraform Plan
* Terraform Apply

Example workflow:

```text
Checkout Code
      ↓
Terraform Init
      ↓
Terraform Validate
      ↓
Terraform Plan
      ↓
Terraform Apply
```

---

# ▶️ Step 7 – Execute the Pipeline

1. Open Jenkins Dashboard.
2. Select the Pipeline Job.
3. Click **Build Now**.
4. Monitor the Console Output.
5. Verify successful deployment.

---

# ✅ Step 8 – Verify AWS Resources

After the pipeline completes successfully, verify the resources in the AWS Console.

Example resources:

* EC2 Instance
* S3 Bucket
* RDS Instance
* IAM Resources

*(Resources depend on your Terraform configuration.)*

---

# 🧹 Destroy Infrastructure

To remove all deployed resources:

```bash
terraform destroy -auto-approve
```

---

# 📌 Jenkins Pipeline Flow

```text
Developer
     │
     ▼
 GitHub Repository
     │
     ▼
 Jenkins Pipeline
     │
     ├── Checkout Code
     ├── Terraform Init
     ├── Terraform Validate
     ├── Terraform Plan
     └── Terraform Apply
            │
            ▼
      AWS Infrastructure
```

---

# 📚 DevOps Concepts Demonstrated

* Infrastructure as Code (IaC)
* Jenkins Declarative Pipeline
* CI/CD Automation
* AWS Infrastructure Provisioning
* Terraform Remote State
* State Locking with DynamoDB
* IAM Authentication
* Secure Credential Management
* Infrastructure Validation
* Automated Deployment

---

# 🎯 Learning Outcomes

By completing this project, I gained hands-on experience in:

* Setting up Jenkins on AWS EC2
* Creating Infrastructure as Code using Terraform
* Automating AWS deployments through Jenkins
* Managing Terraform remote state using Amazon S3
* Implementing Terraform state locking with DynamoDB
* Managing AWS credentials securely in Jenkins
* Building an end-to-end CI/CD pipeline for cloud infrastructure

---

# 📖 Future Enhancements

* Integrate GitHub Webhooks for automatic builds
* Add Terraform Format and Lint stages
* Integrate SonarQube for code quality checks
* Add Slack/Email notifications
* Implement manual approval before deployment
* Deploy applications to Amazon EKS
* Integrate monitoring with Prometheus and Grafana

---

# 👨‍💻 Author

**Sai M**

AWS DevOps Engineer | Terraform | Jenkins | Docker | Kubernetes | AWS | CI/CD | Infrastructure as Code

If you found this project helpful, consider giving it a ⭐ on GitHub.

