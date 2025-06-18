# Nearly completely ChatGPT generated but humanly optimized

if [[ -t 1 ]]; then
    CHOOSE() {
        fzf --prompt="$1 > "
    }
else
    CHOOSE() {
        rofi -dmenu -p "$1"
    }
fi

readarray -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

if [[ ${#MONITORS[@]} -lt 2 ]]; then
    echo "Need at least 2 monitors."
    exit 1
fi

SRC=$(printf "%s\n" "${MONITORS[@]}" | CHOOSE "Select Source Monitor")
[[ -z "$SRC" ]] && exit

DST=$(printf "%s\n" "${MONITORS[@]}" | grep -v "$SRC" | CHOOSE "Select Destination Monitor")
[[ -z "$DST" ]] && exit

readarray -t WORKSPACES < <(hyprctl workspaces -j | jq -r --arg src "$SRC" '.[] | select(.monitor == $src) | .id')

for ws in "${WORKSPACES[@]}"; do
	hyprctl dispatch moveworkspacetomonitor "$ws $DST"
done

notify-send "Hyprland" "Moved workspaces from $SRC to $DST"
