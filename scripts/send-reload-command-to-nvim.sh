#!/usr/bin/env bash

COMMAND='<Esc>:lua reload_matugen_colors()<CR>'

NVIM_SOCKET="${XDG_RUNTIME_DIR}/nvim.sock"

if [ -S "$NVIM_SOCKET" ]
then
	nvim --server "$NVIM_SOCKET" --remote-send "$COMMAND"
	exit 0
else 
	exit 1
fi


