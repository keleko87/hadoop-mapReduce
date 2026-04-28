#!/bin/bash

# --- VARIABLES ---
NOMBRE_ARCHIVO="archivo_grande.txt"
INPUT_HDFS="/user/input"
OUTPUT_HDFS="/user/output/resultado_wordcount"

echo "=========================================="
echo "   HADOOP AUTO-INIT     "
echo "=========================================="

# 1. Generar datos
./generar_datos.sh

# 2. Preparar HDFS
hdfs dfs -rm -r -f $OUTPUT_HDFS 2>/dev/null
hdfs dfs -mkdir -p /user/input

# 3. Subir a HDFS
hdfs dfs -put -f $NOMBRE_ARCHIVO /user/input/

# 4. Buscar el JAR específico de EXAMPLES
echo "[4/5] Localizando el JAR de ejemplos correcto..."
# Buscamos específicamente el que tiene 'examples' en el nombre
JAR_PATH=$(find / -name "hadoop-mapreduce-examples-*.jar" | grep -v "sources" | head -n 1)

if [ -z "$JAR_PATH" ]; then
    echo "ERROR: No se encontró el JAR de ejemplos."
    exit 1
fi
echo "Usando JAR: $JAR_PATH"

# 5. EJECUTAR (Probamos wordcount o WordCount)
echo "[5/5] Lanzando MapReduce..."
# Intentamos ejecutar. Si falla wordcount, Hadoop suele ser sensible a mayúsculas.
hadoop jar $JAR_PATH wordcount /user/input/$NOMBRE_ARCHIVO $OUTPUT_HDFS

# 6. RESULTADOS
if [ $? -eq 0 ]; then
    echo "------------------------------------------"
    echo "ÉXITO: Resultados (Top 10):"
    hdfs dfs -cat $OUTPUT_HDFS/part-r-00000 | head -n 10
    echo "------------------------------------------"
else
    echo "El comando falló. Intentando con 'WordCount' (mayúsculas)..."
    hdfs dfs -rm -r -f $OUTPUT_HDFS
    hadoop jar $JAR_PATH WordCount /user/input/$NOMBRE_ARCHIVO $OUTPUT_HDFS
fi

EOF