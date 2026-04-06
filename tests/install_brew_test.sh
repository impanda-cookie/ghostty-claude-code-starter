#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

source "$repo_root/scripts/lib.sh"
source "$repo_root/scripts/install_brew.sh"

brew_bin_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$brew_bin_dir"
}
trap cleanup EXIT

cat >"$brew_bin_dir/brew" <<'EOF'
#!/usr/bin/env bash
if [[ "$1" == "shellenv" ]]; then
  cat <<'OUT'
export HOMEBREW_PREFIX="/fake/homebrew"
export HOMEBREW_CELLAR="/fake/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/fake/homebrew"
PATH="/fake/homebrew/bin:$PATH"
export PATH
OUT
  exit 0
fi
exit 0
EOF
chmod +x "$brew_bin_dir/brew"

PATH="/usr/bin:/bin"
load_homebrew_env_from_prefix "$brew_bin_dir"

[[ ":$PATH:" == *':/fake/homebrew/bin:'* ]] || {
  echo "expected Homebrew shellenv to update PATH"
  exit 1
}

[[ "${HOMEBREW_PREFIX:-}" == "/fake/homebrew" ]] || {
  echo "expected Homebrew shellenv to export HOMEBREW_PREFIX"
  exit 1
}
