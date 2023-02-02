#!/bin/bash
archivo="precipitaciones.txt"
if [ ! -f $archivo ]; then
  echo "Error: el archivo $archivo no existe"
  exit 1
fi
diasSemana=( "Lunes" "Martes" "Miercoles" "Jueves" "Viernes" "Sábado" "Domingo" )
while read -r linea
do
  archivo=$(echo $linea | awk '{print $2}')
  if [ $archivo -eq 0 ]; then
    diasNoLluvia=$(echo $linea | awk '{print $1}')
    echo "${diasSemana[($diasNoLluvia-1)%7]} no llovio."
    #Este comentario de abajo hace lo mismo, pero indicando el dia. Ejemplo: en vez de mostrar Miercoles no llovio. mostrara Miercoles 3 no llovio.
    #echo "${diasSemana[($diasNoLluvia-1)%7]} $diasNoLluvia no llovio."
  fi
done < "precipitaciones.txt"
