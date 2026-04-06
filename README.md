# ghostty-claude-code-starter

A lightweight Mac terminal starter for people who run Claude Code heavily and want Ghostty, Oh My Zsh, autosuggestions, syntax highlighting, `eza`, and `yazi` working fast.

## What You Get

- Ghostty starter config tuned for daily development
- Oh My Zsh with `agnoster`
- `zsh-autosuggestions` and `zsh-syntax-highlighting`
- `eza` aliases for cleaner file listing
- `yazi` wrapper that keeps your shell in the last visited directory
- Safe config application with backups

## Quick Start

```bash
git clone https://github.com/impanda-cookie/ghostty-claude-code-starter.git
cd ghostty-claude-code-starter
./install.sh
./apply.sh
```

After that:

```bash
source ~/.zshrc
```

If Ghostty is already open, reload or restart it.

## First 30 Seconds

After setup, the fastest things to try are:

```bash
ll
y
```

Quick key cheatsheet:

- `Cmd + ,` in Ghostty: open settings
- `Cmd + D`: split vertically
- `Cmd + Shift + D`: split horizontally
- `y`: launch Yazi
- inside Yazi: `h` goes to parent directory, `l` enters, `q` quits

## Install Flow

`./install.sh`

- checks macOS
- installs Homebrew if needed
- installs packages in `Brewfile`
- installs Oh My Zsh if missing
- installs or updates shell plugins

`./apply.sh`

- backs up your current files
- copies the Ghostty starter config
- updates `ZSH_THEME` to `agnoster`
- updates Oh My Zsh plugins to include:
  - `git`
  - `z`
  - `extract`
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- appends a managed starter block to `~/.zshrc`

## Managed Files

- `~/.config/ghostty/config`
- `~/.zshrc`

Backups are written under:

```text
~/.ghostty-claude-code-starter-backups/
```

## Starter Features

### Ghostty

- clean padding and font defaults
- translucent background
- native URL and path click capture with `Shift`
- ready for split-heavy workflows

### Zsh

- `agnoster` prompt
- hide `user@host` for local sessions
- shorten path display in deep directories
- `ls`, `ll`, `lt` mapped to `eza`
- `y` wrapper for `yazi`

## Yazi Basics

Run:

```bash
y
```

Important behavior:

- `q` quits Yazi completely and returns to the shell
- `h` or `Left` goes back to the parent directory
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

## Optional: Starship

This repo defaults to Oh My Zsh plus `agnoster` because it closely matches the article flow.

If you prefer Starship, see [docs/starship.md](docs/starship.md).

## Fonts

For Powerline and Nerd Font icons, install a Nerd Font and select it in Ghostty.

Recommended setup is documented in [docs/fonts.md](docs/fonts.md).

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
