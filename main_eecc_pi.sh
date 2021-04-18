#!/bin/bash
source rutas.sh
echo "$(date) - Moviendo .PDF a IN_FILES/"
mv $RutaLand/*.PDF IN_FILES/
for f in IN_FILES/*; do
 ./eecc.sh "$f" $1
done
echo "$(date) - Copiando .csv en  $RutaProcesadoCSV"
cp OUT_FILES/*.csv $RutaProcesadoCSV/
echo "$(date) - Copiando .PDF en  $RutaProcesadoPDF"
cp IN_FILES/*.PDF $RutaProcesadoPDF/
echo "$(date) - Eliminando .csv de OUT_FILES/"
rm OUT_FILES/*.csv
echo "$(date) - Eliminando .PDF de IN_FILES/"
rm IN_FILES/*.PDF
