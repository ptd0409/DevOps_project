# DevOps_project
---
## Tools
- Docker
- GitHub
- AWS (EKS, S3, IAM)
- DockerHub
- Terraform

### Step 1: Provision Infrastructure with Terraform
- Created VPC, subnets, and EKS cluster (`max-weather-cluster`)
- Used S3 for storing Terraform state
- Used `terraform-aws-modules/eks` and `vpc` modules
- Provide EKS public API endpoint for only local IP

### Step 2: CI/CD for Docker Image
- Built a backend API (`main.py`) and Dockerized it
- Created GitHub Action to:
  - Build Docker image
  - Tag it by branch name (`dev`, `main`)
  - Push to private DockerHub repo: [`ptd0409/max-weather-api`](https://hub.docker.com/repository/docker/ptd0409/max-weather-api)

### Step 3: Deploy to EKS via CI/CD
- Added Kubernetes manifests (`k8s/deployment.yaml`, `service.yaml`)
- GitHub Actions deploys to EKS automatically when pushing to `dev`, `main` branches
- Auto-detects namespace and tag based on branch name
- CI/CD triggers:
  - Deploys to namespace `dev`, `main`
  - Applies manifests using `kubectl`

---
