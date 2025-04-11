#!/bin/bash
clear
echo -e  "\nCheck the Installation of the Operator...\n"
echo "
kubectl get deploy -n cnpg-system cnpg-controller-manager -o wide
"
#read -p "..."

kubectl get deploy -n cnpg-system cnpg-controller-manager -o wide

echo ""
