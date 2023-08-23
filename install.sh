#!/bin/bash

set -euo pipefail

SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

mkdir -p /usr/local/bin
cp "$SCRIPT_DIR"/src/* /usr/local/bin
# auth_client ask for write perm but not used
chmod +w /usr/local/bin/auth_setting

