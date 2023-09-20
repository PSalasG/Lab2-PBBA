#!/bin/bash

#Se usó el comando de inotifywait para que revise el directorio elegido y guarde cualquier cambio realizado en el archivo log.
inotifywait -r -m cambios -e modify,create,delete | while read path accion archivo; do #Cada variable toma cada uno de las salidas del comando inotifywait y estas se usan para imprimir el registro.
	fecha=$(date)
	echo "Se realizó $accion a el archivo $archivo en la ruta $path ocurrido el: $fecha" >> Registro_direc.tex
done
