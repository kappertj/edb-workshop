#!/bin/bash
. ./config.sh

printf "${green}echo \"create table test (id integer, description text); \ninsert into test values (1, 'TEST1');\" | kubectl-cnpg psql  cluster-example-16${reset}\n"
cat create_table.sql| kubectl-cnpg psql  cluster-example-16
