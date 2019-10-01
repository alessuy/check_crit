#! /bin/bash

path="/etc/scripts/check_crit"
file_mon="/data/logs/syslogs/dccritical.log"

now=$(cat $file_mon | wc -l)
before=$(cat $path/tmp)

if ! [ $now -eq $before ]
 then
   echo "Hay logs de interfaces del core" | mutt -s "Revisar 4500X"  apalermo@bse.com.uy
   echo $now > $path/tmp
 fi

 


