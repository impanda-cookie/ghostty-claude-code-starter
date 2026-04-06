#!/usr/bin/env bash

set -euo pipefail

ensure_oh_my_zsh() {
  if [[ -d "${HOME}/.oh-my-zsh" ]]; then
    info "Oh My Zsh already installed."
    return 0
  fi

  info "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
