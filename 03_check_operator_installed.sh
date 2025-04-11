#!/bin/bash
. ./config.sh
printf "${green}kubectl get deploy cnpg-controller-manager${reset}\n"

kubectl get deploy cnpg-controller-manager -o wide

