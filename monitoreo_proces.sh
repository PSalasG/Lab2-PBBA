#!/bin/bash

proceso="$1"
comando="$2" #El comando debe introducirse entre comillas en el parámetro si tiene espacios.

#Crea un bucle infinito para estar revisando el estado del proceso constantemente.
while true; do
	pgrep $proceso 1> /dev/null #Guardo la stout del comando en este archivo para que no lo iprima en la consola.
	if [ $? == "1" ]; then
		$comando #Ejecuta el comando otorgado para volver a levantar el proceso.
		echo "Se volvió a iniciar el proceso $proceso"
        fi
#No se da niguna confirmación de cuando el proceso esta levantado para no hacer spam con tantos mensajes en la consola.
done
