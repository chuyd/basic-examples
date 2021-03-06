#!/bin/bash

# In bash is posible to create basic
# user interfaces, it could help to create
# a user-friendly program, this application
# called dialog uses ncurses library for that.

INFO="info.txt"
CMD_DIALOG="dialog"

if ! command -v "$CMD_DIALOG" > /dev/null 2>&1; then
	echo "command $CMD_DIALOG not available"
	exit 1
fi

$CMD_DIALOG  --title "Data Registration" \
		--separate-widget $'\n' \
		--inputbox "Name:" 8 40 \
		--inputbox "Email:" 8 40 \
		--inputbox "profile:" 8 40 \
		--radiolist "Select Course:" 10 40 4 \
			1 Linux on \
			2 Iot off \
			3 other off 2>"$INFO"

info=$(cat "$INFO")
echo "$INFO"
dialog --title "Personal information" --msgbox "$info" 10 25 ;

exit 0
