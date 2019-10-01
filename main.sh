#! /bin/bash

path="/etc/scripts/check_crit"
file_mon="/data/logs/syslogs/dccritical.log"

now=$(cat $file_mon | wc -l)
before=$(cat $path/tmp)

if ! [ $now -eq $before ]
 then
   tail -n $(echo $now-$before | bc) $file_mon  | mutt -s "Revisar 4500X"  apalermo@mail 
   echo $now > $path/tmp
 fi

 


