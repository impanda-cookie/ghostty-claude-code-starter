#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "$repo_root/README.md"
  "$repo_root/Brewfile"
  "$repo_root/install.sh"
  "$repo_root/apply.sh"
  "$repo_root/uninstall.sh"
  "$repo_root/scripts/lib.sh"
  "$repo_root/scripts/detect.sh"
  "$repo_root/scripts/backup.sh"
  "$repo_root/scripts/install_brew.sh"
  "$repo_root/scripts/install_oh_my_zsh.sh"
  "$repo_root/scripts/install_plugins.sh"
  "$repo_root/scripts/apply_configs.sh"
  "$repo_root/configs/ghostty/config"
  "$repo_root/configs/zsh/zshrc.append.zsh"
  "$repo_root/docs/fonts.md"
  "$repo_root/docs/starship.md"
  "$repo_root/docs/articles/wechat-short.md"
  "$repo_root/tests/apply_zsh_starter_test.sh"
  "$repo_root/tests/install_brew_test.sh"
)

missing=0
for path in "${required_files[@]}"; do
  if [[ ! -f "$path" ]]; then
    printf 'missing: %s\n' "$path"
    missing=1
  fi
done

if [[ $missing -ne 0 ]]; then
  exit 1
fi

required_executables=(
  "$repo_root/install.sh"
  "$repo_root/apply.sh"
  "$repo_root/uninstall.sh"
  "$repo_root/tests/smoke.sh"
)

for path in "${required_executables[@]}"; do
  if [[ ! -x "$path" ]]; then
    printf 'not executable: %s\n' "$path"
    exit 1
  fi
done

bash -n \
  "$repo_root/install.sh" \
  "$repo_root/apply.sh" \
  "$repo_root/uninstall.sh" \
  "$repo_root/scripts/"*.sh

bash "$repo_root/tests/apply_zsh_starter_test.sh"
bash "$repo_root/tests/install_brew_test.sh"
