# DevOps_project
---
## Tools
- Docker
- GitHub
- AWS (EKS, S3, IAM)
- DockerHub
- Terraform

### Step 1: Provision Infrastructure with Terraform
- Login to AWS -> IAM -> Users -> Create access key
- Go to app.tf -> Run: aws configure -> Paste access key and secret key -> Run: aws sts gets-caller-identity
- Use t2.small
- Terraform init -> terraform apply --auto-approve -> aws eks --region ap-southeast-1 update-kubeconfig --name tien-dung-cluster --kubeconfig <path_file>
- Modifying the cluster name -> Remember to modify the name of cluster in fluentbit.sh
- Modifying the serviceaccount name at Serviceaccount, Clusterrolebinding, Deployment in fluentbit.yaml to match the serviceaccount name in fluentbit.sh
- Provide EKS public API endpoint for only local IP
***If using Kind (k8s in Docker):
- Remove fluentd in configmap, change v2 -> 0 in (because we're not using EC2 now). Remove runlogjournal in volumemount and hostpath. Remove [FILTER] aws
- After applying ingress, service, deployment -> kubectl get svc -> get the external IP -> Add to CloudFlare DNS

### Step 2: CI/CD for Docker Image
- Built a backend API (`main.py`) and Dockerized it
- Created GitHub Action to:
  - Build Docker image
  - Tag it by branch name (`dev`, `main`)
  - Push to private DockerHub repo: [`ptd0409/max-weather-api`](https://hub.docker.com/repository/docker/ptd0409/max-weather-api)
  - Create secrets (Go to project -> Settings -> Secrets and variables): AWS_ACCESS_KEY_ID, AWS_REGION, AWS_SECRET_ACCESS_KEY, DOCKERHUB_TOKEN, DOCKER_USERNAME, EKS_CLUSTER_NAME

### Step 3: Deploy to EKS via CI/CD
- Added Kubernetes manifests (`k8s/deployment.yaml`, `service.yaml`)
- GitHub Actions deploys to EKS automatically when pushing to `dev`, `main` branches
- Auto-detects namespace and tag based on branch name
- CI/CD triggers:
  - Deploys to namespace `dev`, `main`
  - Applies manifests using `kubectl`
- Remember to create secret for backend deployment to pull image from Docker registry

