## Task_2 Fluxcd 


1. Install the Flux CLI
```bash
curl -s https://fluxcd.io/install.sh | sudo bash
```
2. Assign your GitHub personal access token and username as environment variables:
```shell
export GITHUB_TOKEN=<token>
export GITHUB_USER=<username>
```
3. Bootstrap Flux in kubernetes cluster:
```shell
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=onboarding \
  --branch=fluxcd__task_2 \
  --path=./task_2/clusters/my-cluster \
  --personal
  ```
  4. 