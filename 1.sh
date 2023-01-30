#!/bin/bash
if [ $# -ne 1 ]; then
    #Mensaje de error en caso de no indicar el número de subdirectorios.
    echo "Error: debes proporcionar el número de subdirectorios."
    exit 1
fi

if [ ! -f "nombres.txt" ]; then
    #Mensaje de error en caso de que el fichero nombres.txt no exista.
    echo "Error: el fichero nombres.txt no existe."
    exit 1
fi

num_subdir=$1

while read nombre; do
    mkdir "$nombre"
    for i in $(seq 1 $num_subdir); do
        mkdir "$nombre/personal$i"
    done
done < "nombres.txt"
