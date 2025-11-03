#! /usr/bin/env bash

environments=( "QUARTUS_GENERAL" )

base_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_BASE_DIR="$base_folder"/env_dir

for env in "${environments[@]}"; do
	init_file="$ENV_BASE_DIR/$env/init.sh"
	if [[ -f "$init_file" ]]; then
		source "$init_file"
	else
		echo "Warning: $init_file not found" >&2
	fi
done

exit 0
