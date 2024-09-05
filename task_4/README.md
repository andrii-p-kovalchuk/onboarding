### Task 4: Create EKS cluster using Terraform

1. Configure AWS credendials using aws cli:

 ```aws configure```
 
 Enter Access key ID, Secret access key and AWS region

 2. Run next command to create EKS cluster:

 ```terraform init```
 ```terraform validate``` 
 ```terraform plan```
 ```terraform apply```

3. Configure config for kubectl

```aws eks --region <region> update-kubeconfig --name <cluster_name>```

4. Destroy EKS cluster with next command:

```terraform destroy```


