#!/bin/bash
if [ $# -eq 0 ]
then
    echo "Por favor, especifique un directorio como parámetro."
    echo "Uso: ./3.sh (nombre del directorio)"
    exit 1
fi
directorio=$1
if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi
contar=$(find $directorio -name "*.txt" | wc -l)
find $directorio -name "*.txt" -delete
echo "Se han borrado $contar ficheros con extensión .txt en el directorio $directorio."
#Recomendable tener una copia de la carpeta de prueba llamada AP4, antes de ejecutar.
