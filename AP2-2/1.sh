#!/bin/bash
archivo="precipitaciones.txt"
if [ ! -f $archivo ]; then
  echo "Error: el archivo $archivo no existe"
  exit 1
fi
litros=0
dias=0
while read linea; do
  litros=$(($litros + $(echo $linea | awk '{print $2}')))
  dias=$(($dias + 1))
done < "precipitaciones.txt"
media=$(($litros / $dias))
echo "La media de precipitaciones es $media"
