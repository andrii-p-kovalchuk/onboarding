## Task_5 develop helm chart

1. Create kubernetes cluster with minikube

```shell
minikube start
```

2. Install Helm on Ubuntu Linux machine:
```shel
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
3. Create a new helm chart:

```shell
helm create nginxdemos
```
4. In `values.yaml` file edit necessary values
5.  Deploy created Helm chart `nginxdemos` in kubernetes cluster:
```shell
helm install nginxdemos task_5/nginxdemos/
```
6. Check if pods are running:
```shell
kubectl get po -w
```
7.  In order to conect application set up port forwarding:
```shell
kubectl port-forward nginxdemos-6c4455874f-59tj4 8080:80
```
8. To view your application, open your web browser [localhost:8080](localhost:8080)
![alt text](<../pic/Screenshot.png>)