#!/bin/bash

proceso="$1"

#Accede al directorio de proc con la ID del proceso y el readlink da la ruta real.
ruta=$(readlink /proc/$proceso/exe)

#La opción -o toma solamente la información que se especifica y no toda la que imprime el ps, así tomo cada info por separado.
comando=$(ps -p $proceso -o "comm"=)
ppid=$(ps -p $proceso -o "ppid"=)
usuario=$(ps -p $proceso -o "user"=)
porcentaje_cpu=$(ps -p $proceso -o "%cpu"=)
porcentaje_mem=$(ps -p $proceso -o "%mem"=)
estado=$(ps -p $proceso -o "stat"=)

echo "El nombre del proceso es $comando."

echo "El ID del proceso es $proceso."

echo "El PPID del proceso es $ppid."

echo "El usuario que inició el proceso es $usuario."

echo "El porcentaje de uso de CPU del proceso es $porcentaje_cpu."

echo "El porcentaje de uso de memoria es $porcentaje_mem."

echo "La ruta del directorio del proceso es $ruta."

exit 0
