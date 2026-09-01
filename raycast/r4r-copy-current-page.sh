#!/usr/bin/env bash
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title r4r copy current page
# @raycast.mode silent
# @raycast.packageName Clay
#
# Optional parameters:
# @raycast.icon 📋
# @raycast.hotkey cmd + option + shift + r
# @raycast.description Copy title + PR link (no mentions) from the front browser tab; skip Slack draft

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec "$ROOT/r4r-from-browser" --copy "$@"
