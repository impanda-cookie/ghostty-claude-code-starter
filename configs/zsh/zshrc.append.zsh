DEFAULT_USER=$USER

# Keep deep project paths compact in agnoster.
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%2~'
}

# eza aliases
alias ls='eza --icons --git --group-directories-first'
alias ll='eza -lh --icons --git --group-directories-first'
alias lt='eza --tree --level=2 --icons'

# yazi wrapper that updates the shell cwd on exit.
y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
