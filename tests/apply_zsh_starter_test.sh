#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
tmp_home="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_home"
}
trap cleanup EXIT

export HOME="$tmp_home"

source "$repo_root/scripts/lib.sh"
source "$repo_root/scripts/backup.sh"
source "$repo_root/scripts/apply_configs.sh"

cat >"$HOME/.zshrc" <<'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker kubectl)
source $ZSH/oh-my-zsh.sh
EOF

apply_zsh_starter "$repo_root/configs/zsh/zshrc.append.zsh"

result="$(cat "$HOME/.zshrc")"

[[ "$result" == *'plugins=(git docker kubectl z extract zsh-autosuggestions zsh-syntax-highlighting)'* ]] || {
  echo "expected existing plugins to be preserved and starter plugins appended"
  exit 1
}

[[ "$result" == *'ZSH_THEME="agnoster"'* ]] || {
  echo "expected theme to switch to agnoster"
  exit 1
}

[[ "$result" == *'# >>> ghostty-claude-code-starter >>>'* ]] || {
  echo "expected managed starter block to be appended"
  exit 1
}
