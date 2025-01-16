ACTION_VIEW="viewScreenshot"
notify-send "File saved at Path" \
	--app-name="Screenshot" \
	--action=$ACTION_VIEW="View" |
	while read -r action; do
		if [[ "$action" == $ACTION_VIEW ]]; then
			xdg-open ~/Pictures/screenshot.png
		fi
	done
