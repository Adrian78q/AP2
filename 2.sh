#!/bin/bash
if [ ! -f "numeros.txt" ]; then
    #Mensaje de error en caso de que el fichero numeros.txt no exista.
    echo "Error: el fichero numeros.txt no existe"
    exit 1
fi

num_par=0
num_impar=0

echo "-----------------"
echo "Numero par:"
while read numero; do
  if [ $(($numero % 2)) -eq 0 ]; then
    echo $numero
    num_par=$(($num_par + 1))
  fi
done < "numeros.txt"

echo "-----------------"
echo "Numero impar:"
while read numero; do
  if [ $(($numero % 2)) -ne 0 ]; then
    echo $numero
    num_impar=$(($num_impar + 1))
  fi
done < "numeros.txt"
echo "-----------------"
echo "Total Pares: $num_par"
echo "Total Impares: $num_impar"
echo "----------------"
