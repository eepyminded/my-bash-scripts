#!/bin/bash

TELEGRAM_TOKEN=$(cat "$TOKEN")
CHAT_ID1=$(cat "$CHAT_ID")

cd /home/flaskuser/site

source venv/bin/activate

echo "--- Checking for outdated Python packages at $(date) ---"

OUTDATED_PACKAGES_OUTPUT=$(pip list --outdated)

NUM_LINES=$(echo "$OUTDATED_PACKAGES_OUTPUT" | grep -v '^$' | wc -l)

if [ "$NUM_LINES" -gt 2 ]; then
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$CHAT_ID1" -d text="There are python packages to be updated for your site!" > /dev/null 2>&1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$CHAT_ID1" -d text="$OUTDATED_PACKAGES_OUTPUT" > /dev/null 2>&1
  
else
  echo "No packages found to update"
fi

echo "--- Check complete ---"

deactivate
