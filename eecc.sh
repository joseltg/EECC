#!/bin/bash
#usamos ghostscript para extraer el texto del archio PDF $1 con el password $2
#echo "Extrayendo texto del PDF..."
gs -sDEVICE=txtwrite -sPDFPassword=$2 -o tmpeecc.txt "$1" &> /dev/null

#a través de awk procesamos el archivo para ahcerlo tabular
#echo "Convirtiendo a CSV..."
awk -f awk_eecc_ahorros_bcp.sh tmpeecc.txt > "$1.out"

#extraemos el ultimo registro del archivo procesado que tiene el nombre deseado del archivo final
read filename <<< $(awk '/FILENAMEAWK/ {print substr($0,13,32)}' "$1.out")

#quitamos el ultimo registro que contenia el nombre del archivo y volcamos el resultado a un archivo con el nombre final deseado
echo "OUT_FILES/$filename creado OK"
awk '!/FILENAMEAWK/ {print $0}' "$1.out" > OUT_FILES/$filename

#eliminamos los archivo temporales
#echo "Eliminando archivos temporales"
rm tmpeecc.txt "$1.out"  

