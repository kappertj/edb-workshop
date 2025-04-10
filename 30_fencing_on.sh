#!/bin/bash

. ./config.sh 

printf "${green}kubectl-cnpg fencing on cluster-example cluster-example-3${reset}\n"

kubectl-cnpg fencing on cluster-example cluster-example-3

