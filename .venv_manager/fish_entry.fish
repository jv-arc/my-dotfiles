#! /usr/bin/env fish

set environments "QUARTUS_GENERAL" "DOTNET"
set base_folder (dirname (status --current-filename))
set ENV_BASE_DIR "$base_folder/env_dir"


for env in $environments

	set TARGET "$ENV_BASE_DIR/$env"

	if test -d "$TARGET"
		set init_file "$TARGET/init.fish"
		if test -f "$init_file"
			source "$init_file"
		else
			# echo "Warning: no $init_file found, checking for a bash version..." >&2
			set init_file "$TARGET/init.sh"
			if test -f "$init_file"
				bass source "$init_file"
			else
				# echo "Warning: no $init_file found, skipping"
			end
		end
	else
		set init_file "$TARGET.fish"
		if test -f "$init_file"
			source "$init_file"
		else
			# echo "Warning: no $init_file found, checking for a bash version..." >&2
			set init_file "$TARGET.sh"
			if test -f "$init_file"
				bass source "$init_file"
			else
				# echo "Warning: no $init_file found, skipping"
			end
		end
	end
end

