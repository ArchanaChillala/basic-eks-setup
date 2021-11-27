# basic-eks-setup

Creating a basic EKS (managed kubernetes cluster) setup on AWS without using any pre-built terraform modules for EKS. 
- This cluster is setup on top of a default-vpc (not a secure mechanism, but this is just an overview of EKS setup without touching the network layer)
- There is no terraform remote backend created for this. So terraform state is locally managed as per this repo.

### Steps to setup:
- Use your own aws profile name in the provider
- Run `terraform init`
- Run `terraform plan -out out.terraform`
- Run `terraform apply out.terraform`

### Access the EKS cluster

It might take about 20-25 mins for the cluster creation, once the cluster setup is done, perform the following commands

1. Generate Kubeconfig

    ```
    aws eks update-kubeconfig --name <cluster-name>

2. Verify the current cluster context

   ```
   kubectl config current-context

3. Access the cluster resources

    ```
    kubectl get pods -n <namepsace>
