#!/bin/bash
. ./config.sh

printf "${green} echo \"select version();\" | kubectl-cnpg psql  cluster-example-16${reset}\n"
printf "${green} echo \"select * from test;\" | kubectl-cnpg psql  cluster-example-16${reset}\n"
cat verify_data.sql | kubectl-cnpg psql  cluster-example-16
