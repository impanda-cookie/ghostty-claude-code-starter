#!/usr/bin/env bash

set -euo pipefail

ensure_oh_my_zsh_plugin() {
  local name="$1"
  local repo="$2"
  local target="${HOME}/.oh-my-zsh/custom/plugins/${name}"

  mkdir -p "${HOME}/.oh-my-zsh/custom/plugins"

  if [[ -d "$target/.git" ]]; then
    info "Updating plugin: $name"
    git -C "$target" pull --ff-only
    return 0
  fi

  if [[ -d "$target" ]]; then
    warn "Plugin directory exists but is not a git repo: $target"
    return 0
  fi

  info "Installing plugin: $name"
  git clone "$repo" "$target"
}
