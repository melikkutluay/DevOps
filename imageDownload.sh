echo "docker image download is starting"

docker pull bitnami/rabbitmq:3.12.6-debian-11-r14
docker pull hashicorp/vault-k8s:1.3.0
docker pull melikktly/producer:dep-5
docker pull melikktly/consumer:dep-5

echo "docker image download finished"

echo "creating tar files"

docker save -o rabbitmq.tar bitnami/rabbitmq:3.12.6-debian-11-r14
docker save -o vault.tar hashicorp/vault-k8s:1.3.0
docker save -o producer.tar melikktly/producer:dep-5
docker save -o consumer.tar melikktly/consumer:dep-5

echo "tar files created"

echo "image importing to Microk8s"

microk8s images import rabbitmq.tar
microk8s images import vault.tar
microk8s images import producer.tar
microk8s images import consumer.tar

echo "Microk8s image imported "
