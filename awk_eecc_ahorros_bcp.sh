#!/bin/awk -f
BEGIN {FS="|"}
/-[0-9]-[0-9][0-9]/ {CUENTA=substr($0,85,3) substr($0,89,8) substr($0,98,1) substr($0,100,2)}
/DEL  [0-3][0-9]\// {FECHA_DEL=substr($0,101,2) substr($0,98,2) substr($0,95,2);FECHA_AL=substr($0,115,2) substr($0,112,2) substr($0,109,2)}
/SALDO ANTERIOR/ {SALDO_POS=substr($0,64,19);SALDO_NEG=substr($0,45,19)}
/[0-3][0-9](ENE|FEB|MAR|ABR|MAY|JUN|JUL|AGO|SET|OCT|NOV|DIC)/ \ 
{MES=substr($0,12,3);FECHA_PROC=substr($0,10,5);FECHA_VALOR=substr($0,16,5);DESCRIPCION=substr($0,22,23);CARGO=substr($0,45,19);ABONO=substr($0,64,19);\ 
printf "%s|%s|%s|%s|%s|%s|%s|%s\n",FECHA_PROC,FECHA_VALOR,DESCRIPCION,CARGO,ABONO,CUENTA,FECHA_DEL,FECHA_AL}
#END {printf "01%s|01%s|SALDO ANTERIOR POSITIVO|                   |%s|%s|%s|%s\n",MES,MES,SALDO_POS,CUENTA,FECHA_DEL,FECHA_AL; \
#     printf "01%s|01%s|SALDO ANTERIOR NEGATIVO|%s|                   |%s|%s|%s\n",MES,MES,SALDO_NEG,CUENTA,FECHA_DEL,FECHA_AL; \
END  {printf "FILENAMEAWK=%s_%s_%s.csv\n",CUENTA,FECHA_DEL,FECHA_AL}
