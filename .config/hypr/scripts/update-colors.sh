#!/usr/bin/env bash
set -euo pipefail

active_wallpapers="$(hyprctl hyprpaper listactive)"
focused_monitor="$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name' | head -n 1)"

wallpaper="$(printf '%s\n' "$active_wallpapers" | awk -F ': ' -v monitor="$focused_monitor" '$1 == monitor { sub(/^[^:]*: /, ""); print; found = 1; exit } END { if (!found) exit 1 }')" \
    || wallpaper="$(printf '%s\n' "$active_wallpapers" | awk -F ': ' 'NF > 1 { sub(/^[^:]*: /, ""); print; exit }')"

if [[ -z "$wallpaper" || ! -f "$wallpaper" ]]; then
    printf 'No encontré un wallpaper activo válido en Hyprpaper.\n' >&2
    exit 1
fi

matugen image "$wallpaper" \
    --mode smart \
    --type scheme-tonal-spot \
    --prefer saturation \
    --config "$HOME/.config/matugen/config.toml"

palette_css="$HOME/.config/gtk-3.0/matugen-colors.css"
icon_theme="$HOME/.config/matugen/data/icons/Matugen-Adwaita"
icon_source="/usr/share/icons/Adwaita/scalable/places"

color_from_palette() {
    awk -v name="$1" '$1 == "@define-color" && $2 == name { gsub(";", "", $3); print $3; exit }' "$palette_css"
}

folder_back="$(color_from_palette folder_back)"
folder_primary="$(color_from_palette folder_primary)"
folder_front="$(color_from_palette folder_front)"
folder_highlight="$(color_from_palette folder_highlight)"

if [[ -z "$folder_back" || -z "$folder_primary" || -z "$folder_front" || -z "$folder_highlight" ]]; then
    printf 'No encontré los colores de carpeta en la paleta generada por Matugen.\n' >&2
    exit 1
fi

mkdir -p "$icon_theme/scalable/places"
for icon in "$icon_source"/folder*.svg; do
    [[ -f "$icon" ]] || continue
    sed \
        -e "s/#438de6/$folder_back/g" \
        -e "s/#62a0ea/$folder_primary/g" \
        -e "s/#a4caee/$folder_front/g" \
        -e "s/#afd4ff/$folder_highlight/g" \
        -e "s/#c0d5ea/$folder_highlight/g" \
        "$icon" > "$icon_theme/scalable/places/$(basename "$icon")"
done

gtk-update-icon-cache --force "$icon_theme"
gsettings set org.gnome.desktop.interface icon-theme Matugen-Adwaita
bash "$HOME/.config/hypr/scripts/apply-hyprland-borders.sh"
