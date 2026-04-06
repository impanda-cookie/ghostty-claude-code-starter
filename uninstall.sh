#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"

source "$repo_root/scripts/lib.sh"
source "$repo_root/scripts/detect.sh"
source "$repo_root/scripts/apply_configs.sh"

main() {
  require_macos
  remove_zsh_starter_block
  info "Removed only the managed starter block from ~/.zshrc"
  info "Theme, merged plugins, and Ghostty config can be restored manually from ~/.ghostty-claude-code-starter-backups/"
}

main "$@"
