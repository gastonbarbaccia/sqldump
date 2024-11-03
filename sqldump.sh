#!/bin/bash

# Configuración
HOST=""               # Host de la base de datos
USER=""                 # Usuario de la base de datos
PASSWORD=""          # Contraseña de la base de datos
DATABASE=""     # Nombre de la base de datos a exportar
BACKUP_DIR="."   # Carpeta donde se guardará el backup
DATE=$(date +"%Y%m%d_%H%M%S")  # Formato de fecha para el archivo

# Nombre del archivo de backup
BACKUP_FILE="$BACKUP_DIR/${DATABASE}_backup_$DATE.sql"

# Crear el directorio de backup si no existe
mkdir -p "$BACKUP_DIR"

# Realizar el dump de la base de datos
mysqldump -h "$HOST" -u "$USER" -p"$PASSWORD" "$DATABASE" > "$BACKUP_FILE"

# Comprobar si el dump se realizó correctamente
if [ $? -eq 0 ]; then
    echo "Backup de la base de datos $DATABASE completado exitosamente: $BACKUP_FILE"
else
    echo "Error: No se pudo realizar el backup de la base de datos $DATABASE"
    exit 1
fi
