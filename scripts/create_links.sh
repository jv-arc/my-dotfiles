#!/usr/bin/env bash

OPTSTRINGS=":d"
DEBUG="false"

SOURCE_PATH=$(pwd/..)
TARGET_PATH="/home/$USER/.config"

DIR_LIST=( "hypr" "matugen" "tampermonkey" "nvim") 


while getopts "$OPTSTRINGS" OPT; do
    case ${OPT} in
        d)
            DEBUG="true"
            echo ""
            echo "--------------------"
            echo "DEBUG MODE"
            echo "--------------------"
            echo "Printing paths:"
            echo "..."
            ;;
        \?)
            echo="invalid option"
            exit 1;
            ;;
    esac
done


if [[ ! "$DEBUG"=="true" ]]; then
    echo "Generating Links..."
fi

for DIR in "${DIR_LIST[@]}"; do

    FULL_TARGET="$TARGET_PATH/$DIR"
    FULL_SOURCE="$SOURCE_PATH/$DIR"

    if [[ "$DEBUG" == "true" ]]; then

            echo ""
            echo "For $DIR..."
            echo "source: $FULL_SOURCE"
            echo "target: $FULL_TARGET"

    else

        if [[ -d "$FULL_TARGET" ]]; then
            echo "WARNING: Path $FULL_TARGET already exists, skiping..."
            continue
        fi
        if [[ ! -d "$FULL_SOURCE" ]]; then
            echo "WARNING: Path $FULL_SOURCE doesn't exists, skipping..."
            continue
        fi
        if $(ln -s "$FULL_SOURCE" "$FULL_TARGET"); then
            echo "Linking for $DIR created sucesfully"
        else
            echo "ERROR: linking for $DIR failed"
        fi
    fi
done

exit 0;
