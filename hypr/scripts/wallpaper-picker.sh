#!/usr/bin/env bash
export PATH=$PATH:$HOME/.local/bin


# 1. Directorio (Asegúrate de que NO termine en /)
DIR="/home/fpapeschi/Imágenes/Wallpapers"

# 2. Seleccionar imagen (Usamos comillas para evitar el Broken Pipe)
CHOICE=$(ls $DIR | wofi --dmenu --prompt " ")

# Si no elegiste nada, salimos
if [ -z "$CHOICE" ]; then
    exit 1
fi

echo "$FULL_PATH"
# 3. Construir la ruta completa con COMILLAS
FULL_PATH="$DIR/$CHOICE"

ls -l "$FULL_PATH" || echo "ERROR: No puedo leer el archivo de imagen."
# 4. Cambiar el fondo con swww (en segundo plano)
swww img $FULL_PATH --transition-type center --transition-step 90 &

sleep 2
# 5. EL COMANDO QUE SÍ TE FUNCIONA (pero con la ruta protegida)
# Quitamos -n y -q un momento para asegurarnos de que corra igual que tu prueba manual
wal -i $FULL_PATH -n -q 
