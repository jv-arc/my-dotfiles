#! /usr/bin/env bash

SERVER_NAME="monkey-server"
SHARED_DIR="/home/jvctr/.config/tampermonkey"
PORT="8090"
PID_FILE="/tmp/$SERVER_NAME.pid"


cd "$SHARED_DIR"

if [ -f "$PID_FILE" ] ; then
	PID=$(cat "$PID_FILE")
	if kill -0 "$PID" 2>/dev/null; then
		kill -9 "$PID"
	fi
	rm "$PID_FILE"
fi

http-server -c-1 -p "$PORT" &
echo $! > "$PID_FILE"
