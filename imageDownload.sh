echo "docker image download is starting"

docker pull bitnami/rabbitmq:3.12.6-debian-11-r14
docker pull hashicorp/vault-k8s:1.3.0
docker pull melikktly/producer:dep-5
docker pull melikktly/consumer:dep-5

echo "docker image download finished"
