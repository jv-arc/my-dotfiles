#!/usr/bin/env bash

COMMAND='<Esc>:lua reload_matugen_colors()<CR>'

DIR="$XDG_RUNTIME_DIR"


mapfile -t SOCKET_LIST < <(find "$DIR" -name "nvim*.sock" -type s -print 2>/dev/null)

for FILE in "${SOCKET_LIST[@]}"; do
	nvim --server "$FILE" --remote-send "$COMMAND"
done

exit 0

