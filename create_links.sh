#!/usr/bin/env bash

OPTSTRINGS=":d"
DEBUG="false"

SOURCE_PATH=$(pwd)
CONFIG_PATH="/home/$USER/.config"
HOME_PATH="/home/$USER"

CONFIG_LIST=( "hypr" "matugen" "tampermonkey" "nvim" )
HOME_LIST=( ".venv_manager" )

while getopts "$OPTSTRINGS" OPT; do
	case ${OPT} in
		d)
			DEBUG="true"
			echo ""
			echo "--------------------"
			echo "    DEBUG MODE      "
			echo "--------------------"
			echo ""
			;;
		\?)
			echo "invalid option"
			exit 1;
			;;
	esac
done


generate_links() {
	local -n list=$1
	local var2=$2
	local var3=$3

	for DIR in "${list[@]}"; do

    SOURCE="$var2/$DIR"
    TARGET="$var3/$DIR"

    if [[ "$DEBUG" == "true" ]]; then
			echo ""
			echo "For $DIR..."
			echo "source: $SOURCE"
			echo "target: $TARGET"

		fi

		if [[ -d "$TARGET" ]]; then
			echo "WARNING: Path $TARGET already exists, skiping..."
			continue
		fi

		if [[ ! -d "$SOURCE" ]]; then
			echo "WARNING: Path $SOURCE doesn't exists, skipping..."
			continue
		fi

		if $(ln -s "$SOURCE" "$TARGET"); then
			echo "Linking for $DIR created sucesfully"
		else
			echo "ERROR: linking for $DIR failed"
		fi
  	
	done
}

generate_links CONFIG_LIST "$SOURCE_PATH" "$CONFIG_PATH"
generate_links HOME_LIST "$SOURCE_PATH" "$HOME_PATH"

exit 0;
