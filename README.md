# Create cluster
The code in this repo creates an Amazon EKS cluster.

## To run:
terraform init
terraform apply -auto-approve

# Configure Kubectl
aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
