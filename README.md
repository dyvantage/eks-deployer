# eks-deployer
The code in this repo uses Terraform to provision an Amazon EKS cluster.  

## Install Prerequisites
```
./install-prereqs.sh
```

## To build the cluster, run:
```
terraform init
terraform apply -auto-approve
```

## Configure Kubectl
Once the cluster is built, run this command to configure `kubectl` to talk to the cluster:
```
aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
```
