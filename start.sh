#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

PORT=${PORT:-10000}
python3 -m http.server $PORT &

tmate -S /tmp/tmate.sock new-session -d

echo "Várkozás a tmate linkekre..."
tmate -S /tmp/tmate.sock wait-for ssh-connection

echo "--- TMATE SESSION ---"
echo "SSH:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo ""
echo "Web:"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'
echo "---------------------------"

while true; do
  tmate -S /tmp/tmate.sock send-keys "echo 'w: $(date)'" Enter
  sleep 60
done
