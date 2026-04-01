# Terraform DevSecOps Project

## 📌 Overview

This project demonstrates a complete **end-to-end DevOps workflow** using Terraform and GitHub Actions.

It provisions AWS infrastructure using reusable Terraform modules, stores remote state securely, and automates deployment using a CI/CD pipeline with integrated security scanning.

---

## 🏗️ Architecture

* **VPC** with public subnets across multiple AZs
* **EC2 Instances** running Nginx
* **Application Load Balancer (ALB)**
* **S3 Bucket** for remote Terraform state
* **DynamoDB Table** for state locking

---

## ⚙️ Technologies Used

* Terraform (Infrastructure as Code)
* AWS (EC2, VPC, ALB, S3, DynamoDB)
* GitHub Actions (CI/CD)
* tfsec & Checkov (Security Scanning)
* Linux (Amazon Linux 2023)

---

## 📂 Project Structure

```
terraform-project-abdelrahman/
│
├── .github/workflows/terraform.yml   # CI/CD Pipeline
├── bootstrap/                        # Backend (S3 + DynamoDB)
├── main.tf                           # Main infrastructure
├── outputs.tf                        # Outputs (ALB DNS)
├── userdata.sh                       # Nginx setup script
├── .gitignore
```

---

## 🔄 CI/CD Pipeline

The pipeline is triggered manually via GitHub Actions and supports:

* ✅ Terraform Plan
* 🔐 Security Scan (tfsec & Checkov)
* 🚀 Apply Infrastructure
* 💣 Destroy Infrastructure

---

## ▶️ How to Run

1. Go to **GitHub → Actions**
2. Select workflow: `Terraform DevSecOps Pipeline`
3. Click **Run workflow**
4. Choose:

   * `apply` → to create infrastructure
   * `destroy` → to remove infrastructure

---

## 🌐 Output

After deployment, Terraform outputs:

```
ALB DNS = http://<your-alb-dns>
```

Open it in your browser to see:

```
Hello from EC2
```

---

## 🔐 Security

* Remote state stored securely in S3
* State locking via DynamoDB
* Static analysis using:

  * tfsec
  * Checkov

---

## 💡 Key Features

* Modular Terraform design
* Remote backend configuration
* Automated CI/CD pipeline
* DevSecOps practices integrated
* High availability architecture

---

## 🧹 Cleanup

To destroy infrastructure:

* Run pipeline with `destroy`
* EC2, ALB, and networking resources will be removed

---

## 👨‍💻 Author

**Abdelrahman Saad**
DevOps Engineer (Junior Level )

---

## ⭐ Notes

This project was built as a hands-on DevOps practice covering real-world scenarios including infrastructure automation, security, and CI/CD integration.
