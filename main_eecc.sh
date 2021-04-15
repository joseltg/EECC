#!/bin/bash
RutaLand="/home/jtello/OneDrivePersonalProjects/EECC"
RutaProcesadoPDF="/home/jtello/OneDrivePersonalProjects/EECC/ProcesadoPDF"
RutaProcesadoCSV="/home/jtello/OneDrivePersonalProjects/EECC/ProcesadoCSV"
echo "moviendo .PDF a IN_FILES/"
mv $RutaLand/*.PDF IN_FILES/
#cp /home/jtello/OneDrivePersonalProjects/EECC/*.PDF /home/jtello/OneDrivePersonalProjects/EECC/IN_FILES/
for f in IN_FILES/*; do
 ./eecc.sh "$f" $1
#echo "$f"
done
echo "copiando .csv en  $RutaProcesadoCSV"
cp OUT_FILES/*.csv $RutaProcesadoCSV/
echo "copiando .PDF en  $RutaProcesadoPDF"
cp IN_FILES/*.PDF $RutaProcesadoPDF/
echo "eliminando .csv de OUT_FILES/"
rm OUT_FILES/*.csv
echo "eliminando .PDF de IN_FILES/"
rm IN_FILES/*.PDF
