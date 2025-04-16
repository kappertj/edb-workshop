#!/bin/bash
. ./config.sh

printf "${green}echo \"create table test (id integer, description text); \ninsert into test values (1, 'TEST1');\" | kubectl-cnpg psql  cluster-example${reset}\n"
echo "create table test (id integer, description text); insert into test values (1, 'TEST1');" | kubectl-cnpg psql  ${cluster_name}

printf "${green} echo \"select * from test;\" | kubectl-cnpg psql  cluster-example${reset}\n"
echo "select * from test;" | kubectl-cnpg psql  ${cluster_name}
