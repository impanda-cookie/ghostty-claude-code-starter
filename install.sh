#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"

source "$repo_root/scripts/lib.sh"
source "$repo_root/scripts/detect.sh"
source "$repo_root/scripts/install_brew.sh"
source "$repo_root/scripts/install_oh_my_zsh.sh"
source "$repo_root/scripts/install_plugins.sh"

main() {
  require_macos
  ensure_homebrew
  brew_bundle_install "$repo_root/Brewfile"
  ensure_oh_my_zsh
  ensure_oh_my_zsh_plugin \
    "zsh-autosuggestions" \
    "https://github.com/zsh-users/zsh-autosuggestions"
  ensure_oh_my_zsh_plugin \
    "zsh-syntax-highlighting" \
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"

  info "Dependencies installed."
  info "Next: run ./apply.sh"
}

main "$@"
