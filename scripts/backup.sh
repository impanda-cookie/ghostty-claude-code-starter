#!/usr/bin/env bash

set -euo pipefail

timestamp() {
  date +%Y%m%d-%H%M%S
}

ensure_parent_dir() {
  mkdir -p "$(dirname "$1")"
}

backup_file() {
  local src="$1"
  local label="$2"

  [[ -e "$src" ]] || return 0

  mkdir -p "$BACKUP_ROOT"
  local dest="$BACKUP_ROOT/${label}.$(timestamp).bak"
  cp "$src" "$dest"
  info "Backed up $src -> $dest"
}
