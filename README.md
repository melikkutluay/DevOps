# DevOps Tutorial

## Tech

- [RabbitMq] - RabbitMQ is a message broker.
- [SpringBoot] - evented I/O for the backend
- [Vault] - Manage secrets and protect sensitive data
- [Minikube] - Quickly sets up a local Kubernetes cluster
- [Helm] - Package manager for Kubernetes
- [Docker] - Container architectural structure

## Requirements
| Requirments |
| -------|
| Helm|
| Docker |
| Minikube

> Note: `If you want Automatically install, you follow the part of Automatically`.

## Installation Automatically

Install the dependencies and devDependencies.

```sh
sh runAllScript.sh
```
> Note: `If you want Manually install, you follow the part of Manually`.
> Note: `docker login <your docker hub repository domain> -u <username> -p <password>`  Don't forget !
## Installation Manually

## Docker

Rabbitmq,Vault and Spring Application are very easy to install and deploy in a Kubernetes cluster.

```sh
docker login <your docker hub repository domain> -u <username> -p <password>
sh imageDownload.sh
```

## Minikube

Import images to local minikube repository

```sh
sh minikubeImageLoad.sh
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
The kubernetes will expose port rabbitmq (15672), vault (8200) and springboot (8081)
```sh
kubectl port-forward --namespace default svc/rabbitmq 15672:15672
kubectl port-forward --namespace default svc/vault 8200:8200
kubectl port-forward --namespace default svc/producer 8081:8081
```


```sh
curl --location --request POST 'http://localhost:8081/produce?message=deployment_test'
```
## Documantation
We have one options for the documantation, the links are in the icons below, you can visit to document sites by click the icons

### Postman: 
[![N|Solid](https://www.svgrepo.com/show/306590/postman.svg)](https://documenter.getpostman.com/view/14336225/2s9YRB1XGu) 
> Link for Postman: `https://documenter.getpostman.com/view/14336225/2s9YRB1XGu`
