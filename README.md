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

Now you can manage the new cluste with `kubectl`.  For a quick test, list the worker nodes:
```
$ kubectl get nodes
NAME                                       STATUS   ROLES    AGE    VERSION
ip-10-0-1-158.us-east-2.compute.internal   Ready    <none>   110s   v1.17.12-eks-7684af
ip-10-0-3-164.us-east-2.compute.internal   Ready    <none>   108s   v1.17.12-eks-7684af
ip-10-0-3-59.us-east-2.compute.internal    Ready    <none>   107s   v1.17.12-eks-7684af
```
