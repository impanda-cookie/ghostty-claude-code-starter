#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${REPO_ROOT:-}" ]]; then
  REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

BACKUP_ROOT="${HOME}/.ghostty-claude-code-starter-backups"
STARTER_BEGIN="# >>> ghostty-claude-code-starter >>>"
STARTER_END="# <<< ghostty-claude-code-starter <<<"

info() {
  printf '[info] %s\n' "$*"
}

warn() {
  printf '[warn] %s\n' "$*" >&2
}

die() {
  printf '[error] %s\n' "$*" >&2
  exit 1
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}
