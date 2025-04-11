#!/bin/bash
. ./config.sh

printf "${green} echo \"select version();\" | kubectl-cnpg psql  cluster-example-17${reset}\n"
printf "${green} echo \"select * from test;\" | kubectl-cnpg psql  cluster-example-17${reset}\n"
cat verify_data.sql | kubectl-cnpg psql  cluster-example-17
