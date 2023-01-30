#!/bin/bash
if [ ! -f "listado.txt" ]; then
    #Mensaje de error en caso de que el fichero listado.txt no exista.
    echo "Error: el fichero listado.txt no existe"
    exit 1
fi

num_linux=0
num_windows=0
num_processes_linux=0
num_processes_windows=0

while read line; do
  sistema=$(echo $line | awk '{print $2}')
  procesos=$(echo $line | awk '{print $3}')

  if [ "$sistema" = "Linux" ]; then
    num_linux=$(($num_linux + 1))
    num_processes_linux=$(($num_processes_linux + $procesos))
  elif [ "$sistema" = "Windows" ]; then
    num_windows=$(($num_windows + 1))
    num_processes_windows=$(($num_processes_windows + $procesos))
  fi
done < "listado.txt"

echo "---------------"
echo "Linux: $num_linux $num_processes_linux"
echo "Windows: $num_windows $num_processes_windows"
echo "---------------"
