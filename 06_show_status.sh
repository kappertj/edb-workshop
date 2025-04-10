#!/bin/bash
PATH=$PATH:/home/workshop/workshop/bin
#alias kg='/usr/local/bin/kubectl-cnpg'
watch -c -n 2 kubectl-cnpg --color always status cluster-example
#watch -c -n 2 "kubectl-cnpg status cluster-example | tail -20"
