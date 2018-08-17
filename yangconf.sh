#!/bin/sh

echo -e "\nESCENARIO - Data Model Maquina de Turing\n"

echo "Modelo YANG\n"

cat turing-machine.yang

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

echo -e "Estructura del modelo\n"

venv/Scripts/pyang -f tree turing-machine.yang

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

echo  -e "Esqueleto de Instancia XML\n"

venv/Scripts/pyang -f sample-xml-skeleton --sample-xml-skeleton-doctype=config turing-machine.yang

echo -e "\nInstancia\n"
cat turing-machine-config.xml

echo -e "\n"
read -p "*********************" -n 1 -s
echo -e "\n"

venv/Scripts/yang2dsdl -t config turing-machine.yang

