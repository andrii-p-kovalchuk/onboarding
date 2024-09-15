## Task_3 build image using the ansible role on aws

1.   Authenticate to AWS by seting your AWS access key ID as an environment variable.
``` shell
export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
```
2. Install [`Packer`](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli) on your machine with Ubuntu Linux

``` shell
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install packer
```
3. Initialize Packer configuration in working directory:
```shell
cd task_3
packer init .
```
4. Format and validate HCL code
```shell
packer fmt .
packer validate .
```

5. Build Packer image:
```shell
packer build ansible_role.pkr.hcl
```
6. Check for new AMI in your AWS console