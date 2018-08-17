#!/bin/bash

echo -e "\nESCENARIO - Data Model Maquina de Turing\n"

echo -e "Modelo YANG\n"

cat turing-machine.yang

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

echo -e "Estructura del modelo\n"

pyang -f tree turing-machine.yang

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

echo -e "Esqueleto de Instancia XML\n"

pyang -f sample-xml-skeleton --sample-xml-skeleton-doctype=config turing-machine.yang

read -n 1 -s

echo -e "\nInstancia\n"
cat turing-machine-config.xml

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

yang2dsdl -t config turing-machine.yang

echo -e "\n Validando Instancia \n"

yang2dsdl -s -j -b turing-machine -t config -v turing-machine-config.xml

echo -e "\n*********************\n"
read -p "Enviando RPC 'initialize'" -n 1 -s
echo -e "\n"

yang2dsdl -t rpc -v initialize-rpc.xml turing-machine.yang

echo -e "\n"
read -p "Enviando RPC 'run'" -n 1 -s
echo -e "\n\n"
read -p "Esperando por 'halted' (notificacion)" -n 1 -s
echo -e "\n\n"
read -p "Requermiento 'get'" -n 1 -s
echo -e "\n\n"

echo -e "'get-reply':\n"

cat turing-machine-get-reply.xml
