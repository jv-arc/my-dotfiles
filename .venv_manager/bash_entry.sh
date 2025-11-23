#! /usr/bin/env bash

environments=( "QUARTUS_GENERAL" "DOTNET" )

base_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_BASE_DIR="$base_folder"/env_dir

for env in "${environments[@]}"; do

	TARGET="$ENV_BASE_DIR/$env"

	if [[ -d "$TARGET" ]]; then
		init_file="$TARGET/init.sh"

		if [[ -f "$init_file" ]]; then
			source "$init_file"

		else
			echo ""
			# echo "Warning: $init_file not found, skipping" >&2
		fi
	
	else

		init_file="$TARGET.sh"

		if [[ -f "$init_file" ]]; then
			source "$init_file"

		else
			echo ""
			# echo "Warning $init_file not found, skipping" >&2
		fi
	fi
done

