#!/bin/bash
set -e

echo "Inicializando schema..."

/opt/hive/bin/schematool -dbType postgres -initSchema || true

echo "Arrancando metastore..."

exec /opt/hive/bin/hive --service metastore