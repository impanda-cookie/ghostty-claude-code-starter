#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"

source "$repo_root/scripts/lib.sh"
source "$repo_root/scripts/detect.sh"
source "$repo_root/scripts/backup.sh"
source "$repo_root/scripts/apply_configs.sh"

main() {
  require_macos
  apply_ghostty_config "$repo_root/configs/ghostty/config"
  apply_zsh_starter "$repo_root/configs/zsh/zshrc.append.zsh"

  info "Starter config applied."
  info "Run: source ~/.zshrc"
}

main "$@"
