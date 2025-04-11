#!/bin/bash

# Start Docker
#open -a Docker

#i=15
#
#while [ $i -gt 0 ]
#do
#   echo Docker will be started in $i...
#   i=`expr ${i} - 5`
#   sleep 5
#   #i=$b
#done
##sleep 60

# Start cluster
k3d cluster delete
#k3d cluster create --servers 1 --agents 4
k3d cluster create
#k3d cluster start

#./docker_pull_images.sh
#./k3d_import_images.sh

#helm repo add prometheus-community \
#  https://prometheus-community.github.io/helm-charts
#
#helm upgrade --install \
#  -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/kube-stack-config.yaml \
#  prometheus-community \
#  prometheus-community/kube-prometheus-stack

