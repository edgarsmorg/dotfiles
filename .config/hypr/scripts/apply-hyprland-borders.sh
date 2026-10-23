#!/usr/bin/env bash
set -euo pipefail

palette_css="$HOME/.config/gtk-3.0/matugen-colors.css"

color_from_palette() {
    awk -v name="$1" '$1 == "@define-color" && $2 == name { gsub(";", "", $3); print $3; exit }' "$palette_css" \
        | sed 's/^#//'
}

active_primary="$(color_from_palette accent_color)"
active_secondary="$(color_from_palette success_color_breeze)"
inactive="$(color_from_palette unfocused_borders_breeze)"

if [[ -z "$active_primary" || -z "$active_secondary" || -z "$inactive" ]]; then
    printf 'No encontré los colores de borde en la paleta de Matugen.\n' >&2
    exit 1
fi

hyprctl keyword general:col.active_border \
    "rgba(${active_primary}ee) rgba(${active_secondary}ee) 45deg"
hyprctl keyword general:col.inactive_border "rgba(${inactive}aa)"
