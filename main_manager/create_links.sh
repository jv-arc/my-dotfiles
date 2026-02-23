#!/usr/bin/env bash

OPTSTRINGS=":d"
DEBUG="false"

PWD=$(pwd)


DB_DIR="$PWD/db_files"
CONFIG="$PWD/config.txt"
SRC_FILE="$DB_DIR/src_paths.db"
END_FILE="$DB_DIR/end_paths.db"


# Path Prefixes
P_STATE="/home/$USER/.local/state"
P_SHARE="/home/$USER/.local/share"
P_CONFIG="/home/$USER/.config"
P_DOTS="/$PWD/.."



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


load_dictionary() {
	local var_name=$1
	local file_path=$2
	local -A temp_dict

	while IFS='=' read -r key value; do
		if [[ -z "$key" || "$key" == \#* ]]; then
			continue
		fi
		temp_dict[$key]=$(echo "$value" | envsubst)
	
	done < "$file_path"

	declare -gA "$var_name"
	local -n _ref="$var_name"

	for k in "${!temp_dict[@]}"
	do
		_ref[$k]="${temp_dict[$k]}"
	done

}

generate_link() {
	local -n key=$1
	local source_dir=$2
	local target_dir=$3
	local failed='false'

	# Precisa checar a existencia
	SOURCE_PATH="${source_dir[$key]}"
	TARGET_PATH="${target_dir[$key]}"

	if [[ "$DEBUG" == "true" ]]; then
		echo ""
		echo "For $key..."
		echo "source: $SOURCE_PATH"
		echo "target: $TARGET_PATH"
	fi

	if [[ -d "$TARGET_PATH" ]]; then
		echo "WARNING: Path $TARGET_PATH already exists"
		failed='true'
	fi

	if [[ ! -d "$SOURCE_PATH" ]]; then
		echo "WARNING: Path $SOURCE_PATH doesn't exists"
		failed='true'
	fi

	if [[ "$failed" == "true" ]]; then
		return 1
	fi

	if [[ "$DEBUG" == "true" ]]; then
		echo "Would execute: ln -s \"$SOURCE_PATH\" \"$TARGET_PATH\" "
		return 0
	else
		if $(ln -s "$SOURCE_PATH" "$TARGET_PATH"); then
			echo "Linking for $key created successfully"
			return 0
		else
			echo "UNKNOWN ERROR"
			return 1
		fi
	fi

}


load_dictionary "SOURCE_PATH_DIR" "$SRC_FILE"
load_dictionary "TARGET_PATH_DIR" "$END_FILE"
load_dictionary "CONFIG" "$CONFIG"


for key in "${CONFIG[@]}"; do
	if $(generate_link "$key" "$SOURCE_PATH_DIR" "$TARGET_PATH_DIR"); then
		echo ""
	else
		echo "Could not create link for: $key"
	fi
done

exit 0;
