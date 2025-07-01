OUTPUTS=("HDMI-A-2" "DP-1" "DP-2")

if [[ -t 1 ]]; then
	CHOOSE() {
		fzf --prompt="$1 > "
	}
else
	CHOOSE() {
		rofi -dmenu -p "$1"
	}
fi

SRC=$(printf "%s\n" "${OUTPUTS[@]}" | CHOOSE "Select Output to modify")
MODE=$(printf "Extend - right\nExtend - left\nExtend - up\nExtend - down\nMirror Laptop" | CHOOSE "Select mode")

case $MODE in
	"Extend - right")
		hyprctl keyword monitor "$SRC,preferred,auto-right,1"
		;;
	"Extend - left")
		hyprctl keyword monitor "$SRC,preferred,auto-left,1"
		;;
	"Extend - up")
		hyprctl keyword monitor "$SRC,preferred,auto-up,1"
		;;
	"Extend - down")
		hyprctl keyword monitor "$SRC,preferred,auto-down,1"
		;;
	"Mirror Laptop")
		hyprctl keyword monitor "$SRC,preferred,auto-right,1,mirror,eDP-1"
		;;
esac

