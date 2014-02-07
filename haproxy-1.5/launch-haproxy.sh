#!/bin/bash
if [[ -z "$CONFIG" ]]; then
  echo "CONFIG environment variable must be set"
  echo "       It must point to the haproxy config file"
  echo "Abort."
  exit 1
fi

PIDFILE=/haproxy/haproxy.pid

haproxy -D -f $CONFIG -p $PIDFILE

while inotifywait -e close_write $CONFIG; do
  haproxy -D -f $CONFIG -p $PIDFILE -sf $(< $PIDFILE)
done
