#!/bin/bash
. ./config.sh

printf "${green} echo \"select * from test;\" | kubectl-cnpg psql  cluster-restore${reset}\n"
echo "select * from test;" | kubectl-cnpg psql  cluster-restore
