# Bull Board on GCP with Terraform

This project deploys [Bull Board](https://github.com/felixmosh/bull-board) UI and Redis using Docker Compose on a Google Cloud Compute Engine VM and
managed by Terraform.

---

## Prerequisites

- [Google Cloud SDK (`gcloud`)](https://cloud.google.com/sdk/docs/install) installed and authenticated.
- A Google Cloud project with billing enabled.
- SSH key pair for VM access.
- Terraform installed.

---

## Folder Structure

```bash
terraform/
├── docker-compose.yml # Docker Compose file for running the service 
├── main.tf # Terraform main configuration
├── variables.tf # Terraform input variables
├── outputs.tf # Terraform outputs
```

## Setup Instructions

### 1. Authenticate with Google Cloud

Run **application-default login** to authorize Terraform to use your credentials:

```bash
gcloud auth application-default login 
```

### 2. Deploy using terraform

Get into the terraform folder and run -

```bash
terraform init
terraform plan (optional)
terraform apply
```