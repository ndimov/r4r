#!/usr/bin/env bash
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title r4r current page
# @raycast.mode silent
# @raycast.packageName Clay
#
# Optional parameters:
# @raycast.icon 🔗
# @raycast.hotkey cmd + option + r
# @raycast.description Copy the front browser tab URL and run r4r (ready-for-review Slack draft)

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec "$ROOT/r4r-from-browser" "$@"
