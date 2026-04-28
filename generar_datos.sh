#!/bin/bash

# Definimos el array
palabras=("hola" "hadoop" "mundo" "mapreduce" "docker" "bigdata" "clúster" "datos" "ingeniería" "nube")

# Guardamos la longitud en una variable
longitud=${#palabras[@]}

# Borramos el archivo si ya existe para empezar de cero
rm -f archivo_grande.txt

echo "Generando datos..."

# Generamos el archivo usando esa variable
for i in {1..100000}; do
    p1=${palabras[$RANDOM % longitud]}
    p2=${palabras[$RANDOM % longitud]}
    echo "linea_$i $p1 $p2" >> archivo_grande.txt
done

echo "Archivo 'archivo_grande.txt' generado con éxito."

EOF
