#!/usr/bin/env bash

set -euo pipefail

require_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    die "This starter currently supports macOS only."
  fi
}
