#!/usr/bin/env bash
# Launch the JSSpeccy 3 embed locally and open the browser at the landing
# page. The repo is private; this is the supported way to use the web
# emulator without hosting it publicly.
#
# Usage:
#   tools/play.sh          # serves on the default port (8000)
#   tools/play.sh 9000     # serves on a custom port
#
# Stops the server with Ctrl+C.

set -euo pipefail

PORT="${1:-8000}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
URL="http://localhost:${PORT}/"

echo "Serving ${ROOT} on ${URL}"
echo "Press Ctrl+C to stop."

# Open the browser asynchronously so the server foreground can be Ctrl+C'd.
( sleep 1 && (open "${URL}" 2>/dev/null || xdg-open "${URL}" 2>/dev/null || true) ) &

cd "${ROOT}"
exec python3 -m http.server "${PORT}"
