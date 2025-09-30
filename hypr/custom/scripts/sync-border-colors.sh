#!/bin/bash

COLOR_FILE="/home/jvctr/.local/state/quickshell/user/generated/colors.json"

if [[ ! -f "$COLOR_FILE" ]]; then
	echo "Arquivo de cores não encontrado: $COLOR_FILE"
	exit 1
fi

PRIMARY_COLOR=$(jq -r '.primary' "$COLOR_FILE" | sed 's/^#//') 

if [[ -z "$PRIMARY_COLOR" ]]; then
	echo "Variável PRIMARY_COLOR não encontrada no arquivo"
	exit 1
fi

/usr/bin/hyprctl keyword general:col.active_border "rgb($PRIMARY_COLOR)"
echo "Cor Aplicada"
