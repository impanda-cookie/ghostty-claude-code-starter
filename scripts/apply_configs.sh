#!/usr/bin/env bash

set -euo pipefail

managed_plugins=(
  git
  z
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
)

apply_ghostty_config() {
  local source_config="$1"
  local target_config="${HOME}/.config/ghostty/config"

  ensure_parent_dir "$target_config"
  backup_file "$target_config" "ghostty-config"
  cp "$source_config" "$target_config"
  info "Wrote $target_config"
}

ensure_zshrc_exists() {
  local zshrc="${HOME}/.zshrc"

  if [[ ! -f "$zshrc" ]]; then
    cat >"$zshrc" <<'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
EOF
    info "Created $zshrc"
  fi
}

upsert_zsh_setting() {
  local file="$1"
  local key="$2"
  local value="$3"

  if grep -Eq "^${key}=" "$file"; then
    perl -0pi -e "s/^${key}=.*$/${value}/m" "$file"
    return 0
  fi

  if grep -Eq '^source \$ZSH/oh-my-zsh\.sh$' "$file"; then
    perl -0pi -e "s/^source \\\$ZSH\\/oh-my-zsh\\.sh$/${value}\nsource \\\$ZSH\\/oh-my-zsh.sh/m" "$file"
    return 0
  fi

  printf '\n%s\n' "$value" >>"$file"
}

contains_plugin() {
  local needle="$1"
  shift

  local item
  for item in "$@"; do
    [[ "$item" == "$needle" ]] && return 0
  done

  return 1
}

merge_oh_my_zsh_plugins() {
  local file="$1"
  local existing_line existing_body
  local -a plugins merged
  local plugin

  existing_line="$(sed -nE 's/^plugins=\((.*)\)$/\1/p' "$file" | head -n 1)"
  if [[ -n "$existing_line" ]]; then
    existing_body="$existing_line"
    # shellcheck disable=SC2206
    plugins=($existing_body)
  else
    plugins=()
  fi

  merged=("${plugins[@]}")
  for plugin in "${managed_plugins[@]}"; do
    if ! contains_plugin "$plugin" "${merged[@]}"; then
      merged+=("$plugin")
    fi
  done

  upsert_zsh_setting "$file" "plugins" "plugins=(${merged[*]})"
}

remove_zsh_starter_block() {
  local zshrc="${HOME}/.zshrc"
  [[ -f "$zshrc" ]] || return 0

  perl -0pi -e 's/\n?# >>> ghostty-claude-code-starter >>>.*?# <<< ghostty-claude-code-starter <<<\n?/\n/s' "$zshrc"
}

append_zsh_starter_block() {
  local zshrc="$1"
  local block_file="$2"

  remove_zsh_starter_block
  printf '\n%s\n' "$STARTER_BEGIN" >>"$zshrc"
  cat "$block_file" >>"$zshrc"
  printf '\n%s\n' "$STARTER_END" >>"$zshrc"
}

apply_zsh_starter() {
  local block_file="$1"
  local zshrc="${HOME}/.zshrc"

  ensure_zshrc_exists
  backup_file "$zshrc" "zshrc"
  upsert_zsh_setting "$zshrc" "ZSH_THEME" 'ZSH_THEME="agnoster"'
  merge_oh_my_zsh_plugins "$zshrc"
  append_zsh_starter_block "$zshrc" "$block_file"
  info "Updated $zshrc"
}
