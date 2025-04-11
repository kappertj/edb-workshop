#!/bin/bash

. ./config.sh

printf "${green}kubectl apply -f cluster-example-16.yaml${reset}\n"

kubectl apply -f cluster-example-16.yaml
