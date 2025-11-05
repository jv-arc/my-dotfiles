#!/usr/bin/env bash

COMMAND='<Esc>:lua reload_matugen_colors()<CR>'

DIR="$XDG_RUNTIME_DIR"
PREFIX="nvim"
SUFIX=".sock"

mapfile -t SOCKET_LIST < <(find "$DIR" -name "nvim*.sock" -type f -print 2>/dev/null)

echo "${SOCKET_LIST[@]}"
for FILE in "${SOCKET_LIST[@]}"; do
  echo "$FILE"
	#nvim --server "$FILE" --remote-send "$COMMAND"
done

exit 0

