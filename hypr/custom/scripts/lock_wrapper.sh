#! /usr/bin/env bash

mpvpaper  -vs -o "no-audio loop" --layer overlay '*' ~/Downloads/a.mp4 &
MPVPAPER_PID=$!
sleep 2
hyprlock
pkill mpvpaper

