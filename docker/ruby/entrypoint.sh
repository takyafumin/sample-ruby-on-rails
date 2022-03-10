#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /src/tmp/pids/server.pid

exec "$@"
