#! /usr/bin/env fish

set environments "QUARTUS_GENERAL"
set base_folder (dirname (status --current-filename))
set ENV_BASE_DIR "$base_folder/env_dir"

for env in $environments
  set init_file "$ENV_BASE_DIR/$env/init.sh"
  if test -f "$init_file"
  	bass source "$init_file"
  else
  	echo "Warning: $init_file not found" >&2
	end
end

exit 0
