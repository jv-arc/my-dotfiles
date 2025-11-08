#! /usr/bin/env bash


if [ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]; then
	cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

exec "nvim"
