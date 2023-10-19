# DevOps Tutorial

## Tech

- [RabbitMq] - RabbitMQ is a message broker.
- [SpringBoot] - evented I/O for the backend
- [Vault] - Manage secrets and protect sensitive data
- [Minikube] - Quickly sets up a local Kubernetes cluster
- [Helm] - Package manager for Kubernetes
- [Docker] - Container architectural structure

## Installation

Install the dependencies and devDependencies.

```sh
install.sh
```

## Plugins

Indicate where to use it in your own application is linked below.

| Plugin | README |
| ------ | ------ |
| amqplib| rabbitmq|
| vault| auth password |
| spring web| create restfull service |

## requirements
| Requirments |
| -------|
| Helm|
| Docker |
| Minikube

## Docker

Rabbitmq,Vault are very easy to install and deploy in a Kubernetes cluster.

By default, the kubernetes will expose port 5672,15672 and 8200,8201

Import images to local minikube repository

```sh
docker load < $PWD/tar/rabbitmq.tar
docker load < $PWD/tar/vault.tar
docker load < $PWD/tar/producer.tar
docker load < $PWD/tar/consumer.tar

minikube image load bitnami/rabbitmq:3.12.6-debian-11-r14
minikube image load hashicorp/vault-k8s:1.3.0
minikube image load producer:dep-5
minikube image load consumer:dep-5

```

Create helm releases

```sh
cd ./helm-chart
helm install rabbitmq ./rabbitmq/ --values ./rabbitmq/values.yaml
helm install vault --set='server.dev.enabled=true' hashicorp/vault
helm install producer ./producer/ --values ./producer/values.yaml
helm install consumer ./consumer/ --values ./consumer/values.yaml
```

Get vault token 

```sh
kubectl exec --stdin=true --tty=true vault-0 -- vault token create
```

Create secret into Vault

```sh
kubectl exec --stdin=true --tty=true vault-0 -- vault kv put -mount=secret vaultdemo demo.username=user demo.password=user
```

```sh
kubectl port-forward --namespace default svc/rabbitmq 15672:15672
kubectl port-forward --namespace default svc/vault 8200:8200
kubectl port-forward --namespace default svc/producer 8081:8081
```

> Note: `` is defined.


```sh
curl --location --request POST 'http://localhost:8081/produce?message=deployment_test'
```
## Documantation
We have two options for the documantation, the links are in the icons below, you can visit to document sites by click the icons

### Postman: 
[![N|Solid](https://www.svgrepo.com/show/306590/postman.svg)](https://documenter.getpostman.com/view/14336225/2s8YzUwLjA) 
> Link for Postman: `https://documenter.getpostman.com/view/14336225/2s8YzUwLjA`
### Swagger_UI:
[![N|Solid](https://www.svgrepo.com/show/374111/swagger.svg)](http://localhost:3000/api-docs/) 
> Link for Swagger-Ui: `http://localhost:3000/api-docs`
