## Task_1 create a concourse test pipeline with bash output as "hello world" 

1. Instal [`ConcourseCI`](https://concourse-ci.org/quick-start.html#docker-compose-concourse) on your Ubuntu Linux machine

```shell
curl -O https://concourse-ci.org/docker-compose.yml
docker-compose up -d
```

2. Install Concourse CLI Fly:
```shell
curl 'http://localhost:8080/api/v1/cli?arch=amd64&platform=linux' -o fly
chmod +x ./fly
sudo mv ./fly /usr/local/bin/
```
3. Log into your local Concourse as the test user:
```shell
fly -t tutorial login -c http://localhost:8080 -u test -p test
```

4. Run the pipeline
```shell
fly -t tutorial set-pipeline -p hello-world -c hello-world.yml
# pipelines are paused when first created
fly -t tutorial unpause-pipeline -p hello-world
# trigger the job and watch it run to completion
fly -t tutorial trigger-job --job hello-world/hello-world-job --watch
```