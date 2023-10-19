
chmod 700 $PWD/tar

docker load < $PWD/tar/rabbitmq.tar
docker load < $PWD/tar/producer.tar
docker load < $PWD/tar/consumer.tar
docker load < $PWD/tar/vault.tar

minikube image load bitnami/rabbitmq:3.12.6-debian-11-r14