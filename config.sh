#!/bin/bash

export PATH=$PATH:~/bin
kubectl_cmd="kubectl"
kubectl_cnp="kubectl-cnp"
cluster_name="cluster-example"

NS=`oc whoami`
oc project $NS

reset="\e[0m" #reset color
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
