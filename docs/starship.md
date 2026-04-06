# Optional: Starship

This starter defaults to Oh My Zsh plus `agnoster` because it matches the article flow and keeps setup simple.

If you prefer Starship:

```bash
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

Then remove or ignore the `ZSH_THEME` line in `~/.zshrc`.

Starship is a good fit if you want:

- faster theme switching
- a single prompt config file
- less theme logic tied to Oh My Zsh
