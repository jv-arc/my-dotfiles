#! /usr/bin/env bash

SOURCE="$HOME/0/my-dotfiles/splash.txt"
TARGET="$HOME/.config/illogical-impulse/config.json"

contens=$(<"$SOURCE")

quotes=()
while [[ $content ]]; do
    quotes+=( "${content%%---*}" )
    content=${content#*---}
    [[ ${content} == "${quotes[-1]}" ]] && break
done

[[ -z "${quotes[-1]}" ]] && unset 'quotes[-1]'

random_index=$((RANDOM % ${#quotes[@]}))
RANDOM_QUOTE="${quotes[$random_index]}"


RANDOM_SPLASH=$(echo "$RANDOM_QUOTE" | xargs)



TEMP_FILE=$(mktemp)

if jq --arg splash "$RANDOM_SPLASH" '.background.quote = $splash' "$TARGET" > "$TEMP_FILE"
then
	mv "$TEMP_FILE" "$TARGET"
else
	echo "Error Uploading JSON" >&2
	rm -rf "$TEMP_FILE"
	exit 1
fi

exit 0

