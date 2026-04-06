# ghostty-claude-code-starter

Ghostty + Oh My Zsh + `eza` + `yazi`, packaged as a lightweight Mac terminal starter for Claude Code workflows.

If your daily terminal routine looks like this, this repo is for you:

- one Claude Code session on the left
- tests or logs on the right
- fast project switching without fighting plain `ls` and awkward shell defaults

This starter is intentionally small. It does not try to become a full personal dotfiles framework. It gives you a clean Ghostty base, a better Zsh prompt, autosuggestions, syntax highlighting, better file listing, and a usable `yazi` setup with safe backups.

## Why This Exists

The default macOS terminal is usable, but it starts to feel clumsy once you are doing high-frequency terminal work:

- opening multiple Claude Code sessions
- watching logs while running commands
- jumping across repos all day
- wanting the terminal to feel fast and readable, not just functional

This repo turns that into a quick install path instead of a two-hour manual setup session.

## Quick Start

```bash
git clone https://github.com/impanda-cookie/ghostty-claude-code-starter.git
cd ghostty-claude-code-starter
./install.sh
./apply.sh
source ~/.zshrc
```

If Ghostty is already open, reload it or restart it once.

## What You Get In 30 Seconds

- Ghostty starter config with clean spacing and sensible defaults
- Oh My Zsh with `agnoster`
- `zsh-autosuggestions` and `zsh-syntax-highlighting`
- `eza` aliases for better directory listing
- `y` as a `yazi` launcher that keeps your shell in the last visited directory
- safe backup of files before config changes

## First Things To Try

After setup:

```bash
ll
y
```

Useful Ghostty shortcuts:

- `Cmd + ,`: open Ghostty settings
- `Cmd + D`: split vertically
- `Cmd + Shift + D`: split horizontally

Useful Yazi keys:

- `h`: go to the parent directory
- `l`: enter a directory
- `q`: quit Yazi and return to the shell

## Best Fit

This repo is a good fit if you want:

- a starter setup, not a giant dotfiles system
- a terminal stack that feels better for Claude Code multi-window work
- a safe apply step with backups
- sane defaults you can still edit later

This repo is not trying to:

- manage every shell preference you have
- replace a deeply customized dotfiles setup
- choose tmux, cmux, or Starship for you

## Install Flow

`./install.sh`

- checks macOS
- installs Homebrew if needed
- installs packages from `Brewfile`
- installs Oh My Zsh if missing
- installs or updates shell plugins

`./apply.sh`

- backs up your current files
- writes the Ghostty starter config
- switches `ZSH_THEME` to `agnoster`
- merges required Oh My Zsh plugins into your existing plugin list
- appends one managed starter block to `~/.zshrc`

## Included Defaults

### Ghostty

- JetBrains Mono Nerd Font
- clean window padding
- slightly translucent background
- `mouse-shift-capture = true` for path and URL click handling

### Zsh

- `agnoster` prompt
- hidden local `user@host`
- shorter deep path display
- `ls`, `ll`, `lt` mapped to `eza`
- `y` wrapper for `yazi`

## Yazi Basics

Run:

```bash
y
```

Important behavior:

- `q` quits Yazi completely and returns to the shell
- `h` or `Left` goes to the parent directory
- `l` or `Right` enters a directory
- when you quit, your shell stays in the last directory you were viewing

Common keys:

- `j` / `k`: move down or up
- `h` / `Left`: go to parent directory
- `l` / `Right`: enter directory or open file
- `Enter`: open file or enter directory
- `Space`: select or unselect a file
- `y`: copy selected files
- `x`: cut selected files
- `p`: paste files
- `q`: quit Yazi

## Managed Files

- `~/.config/ghostty/config`
- `~/.zshrc`

Backups are written under:

```text
~/.ghostty-claude-code-starter-backups/
```

## Fonts

This starter assumes a Nerd Font for prompt glyphs and file icons.

Recommended setup is documented in [docs/fonts.md](docs/fonts.md).

## Optional: Starship

This repo defaults to Oh My Zsh plus `agnoster` because it matches the starter flow and keeps setup simple.

If you prefer Starship, see [docs/starship.md](docs/starship.md).

## Partial Uninstall

```bash
./uninstall.sh
```

This removes only the managed starter block from `~/.zshrc`.

It does not automatically restore:

- your previous `ZSH_THEME`
- your previous merged plugin list
- your Ghostty config
- packages installed through Homebrew

For a full rollback, restore from `~/.ghostty-claude-code-starter-backups/`.

## Repo Layout

```text
.
├── Brewfile
├── install.sh
├── apply.sh
├── uninstall.sh
├── configs/
├── scripts/
├── docs/
└── tests/
```
