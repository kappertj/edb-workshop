#!/bin/bash
. ./config.sh

ip=`kubectl get route | grep minio-api | awk '{print $2}'`
sed -e 's/#IP#/'${ip}'/' cluster-example-upgrade-template.yaml > cluster-example-upgrade.yaml
printf "${green}kubectl apply -f cluster-example-upgrade.yaml${reset}\n"

diff -a --suppress-common-lines -y cluster-example.yaml cluster-example-upgrade.yaml

kubectl apply -f cluster-example-upgrade.yaml
