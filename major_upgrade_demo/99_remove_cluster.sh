#!/bin/bash

# Uninstall cluster
#kubectl delete -f cluster-example.yaml
rm cluster-example.yaml

# Uninstall operator
#kubectl delete -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/releases/cnpg-1.18.0.yaml

# Delete cluster
k3d cluster delete
#k3d cluster create
#k3d cluster stop

# Stop MinIO
#ps | grep "start_minio" | grep -v grep | awk '{print $1}' | xargs -I % kill %
docker ps | grep minio | awk '{print $1}' | xargs -I % docker stop %

#`docker images | awk '/cloudnative-pg/ {print "docker image rm -f " $3}'`
#docker images

## Stop Docker:
ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
