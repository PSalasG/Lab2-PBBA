#!/bin/bash

proceso=$1

#Toma la ubicación del programa y usa eso para ejecutarlo.
ejecutable=$(readlink -f $proceso)

#El "&" lo ejecuta en segundo plano para que se siga corriendo el resto del script.
$ejecutable &

#Se agregan titulos para el log.
echo "%CPU   %MEM   TIME" 1> Registro_cpu_mem.tex

#La variable se usa para mantener el while, esta cambia de valor cuando el proceso deja de ejecutarse.
ejecutando=0
while [ $ejecutando == "0" ]; do
	cpu=$(ps -C $proceso -o "%cpu"=)
	memoria=$(ps -C $proceso -o "%mem"=)
	tiempo=$(date "+%T") #Se obtiene la hora a la que ocurre el registro para escribirla en el archivo de log.
	
	if [ "$cpu" == "" ]; then #Cuando esta variable es vacia quiere decir que el proceso de terminó por lo que el comando "ps" no imprime nada.
                ejecutando=1

	else
		echo "$cpu   $memoria   $tiempo" 1>> Registro_cpu_mem.tex #Si el proceso no se detuvo imprime el registro en el archivo log.
	fi

	sleep 1 #Espera un tiempo antes de volver a revisar el proceso, esto para que el log no se llene tan rapido y reporte distintos valores de tiempo.
done

exit 0
