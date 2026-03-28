#!/bin/bash

# Archivo de configuración temporal
config_file="/tmp/waybar_cava_config"

echo "
[general]
bars = 10
sleep_timer = 0
noise_reduction = 0.1
gravity = 50

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > "$config_file"

# Ejecutar cava y transformar la salida en barras visuales
cava -p "$config_file" | sed -u 's/;//g;s/0/ /g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g'
