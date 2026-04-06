#!/usr/bin/env bash

set -euo pipefail

load_homebrew_env_from_prefix() {
  local bin_dir="$1"

  if [[ -x "$bin_dir/brew" ]]; then
    eval "$("$bin_dir/brew" shellenv)"
    return 0
  fi

  return 1
}

load_homebrew_env() {
  load_homebrew_env_from_prefix "/opt/homebrew/bin" && return 0
  load_homebrew_env_from_prefix "/usr/local/bin" && return 0

  if command_exists brew; then
    eval "$(brew shellenv)"
    return 0
  fi

  return 1
}

ensure_homebrew() {
  if command_exists brew; then
    load_homebrew_env || true
    info "Homebrew already installed."
    return 0
  fi

  info "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_homebrew_env || die "Homebrew installed, but brew is still not available in this shell."
}

brew_bundle_install() {
  local brewfile="$1"
  info "Installing packages from $brewfile"
  brew bundle --file="$brewfile"
}
