# DevOps Tutorial

## Tech

- [RabbitMq] - RabbitMQ is a message broker.
- [SpringBoot] - evented I/O for the backend
- [Vault] - Manage secrets and protect sensitive data
- [Microk8s] - Quickly sets up a local Kubernetes cluster
- [Helm] - Package manager for Kubernetes
- [Docker] - Container architectural structure

## Requirements
| Requirments |
| -------|
| Helm|
| Docker |
| Microk8s |

> Note: `If you want Automatically install, you follow the part of Automatically`.

## Installation Automatically

Install the dependencies and devDependencies.

```sh
sh runAllScript.sh
```
> Note: `If you want Manually install, you follow the part of Manually`.

## Installation Manually

```sh
sh install.sh
```

## Docker

Rabbitmq,Vault and Spring Application are very easy to install and deploy in a Kubernetes cluster.

```sh
sh imageDownload.sh
```

## Microk8s

Imported images to local Microk8s repository with imageDownload script file


Create helm releases

```sh
sh runHelmChart.sh
```

Get default vault token 

```sh
export VAULT_TOKEN=$(microk8s kubectl logs pod/vault-0 | grep "Root Token")
```
Generate a new vault token

> Note: if you generated new token, you must set 'VAULT_TOKEN' parameter into values.yaml files of producer and consumer

```sh
kubectl exec --stdin=true --tty=true vault-0 -- vault token create
```
Create secret into Vault

```sh
kubectl exec --stdin=true --tty=true vault-0 -- vault kv put -mount=secret vaultdemo demo.username=user demo.password=user
```

The kubernetes will expose port rabbitmq (15672), vault (8200) and springboot (8081)

```sh
microk8s kubectl port-forward --namespace default svc/rabbitmq 15672:15672  // Optional
microk8s kubectl port-forward --namespace default svc/vault 8200:8200       // Optional
microk8s kubectl port-forward --namespace default svc/producer 8081:8081
microk8s kubectl port-forward --namespace default svc/consumer 8080:8080
```

You can use curl.sh file for write to queue; 
```sh
sh curl.sh
```

Optional curl script

```sh
curl --location --request POST 'http://localhost:8081/produce?message=deployment_test'
```

## Documantation
We have one options for the documantation, the links are in the icons below, you can visit to document sites by click the icons

### Postman: 

[![N|Solid](https://www.svgrepo.com/show/306590/postman.svg)=100x20](https://documenter.getpostman.com/view/14336225/2s9YRB1XGu) 
> Link for Postman: `https://documenter.getpostman.com/view/14336225/2s9YRB1XGu`
