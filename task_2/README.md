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
  4.  Add podinfo repository to Flux
  ```shell
  flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=1m \
  --export > ./clusters/my-cluster/podinfo-source.yaml
  ```
  5. Commit and push changes
  6. Create a Kustomization that applies the podinfo deployment
  ```shell
  flux create kustomization podinfo \
  --target-namespace=default \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --wait=true \
  --interval=30m \
  --retry-interval=2m \
  --health-check-timeout=3m \
  --export > ./clusters/my-cluster/podinfo-kustomization.yaml
  ```
   7. Commit and push changes
   8. Add the following to the field `spec` of your `podinfo-kustomization.yaml` file
   ```yaml
   patches:
    - patch: |-
        apiVersion: autoscaling/v2
        kind: HorizontalPodAutoscaler
        metadata:
          name: podinfo
        spec:
          minReplicas: 3             
      target:
        name: podinfo
        kind: HorizontalPodAutoscaler
```
9. Commit and push changes
10. Quantity of pods will be 3.
![alt text](<pic/Screenshot.png>)
