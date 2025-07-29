I store all my dotfiles here.

# Install / Sources
INSTALL: https://formulae.brew.sh/formula/stow
source: https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/
source: https://www.youtube.com/watch?v=y6XCebnB9gs

# Philosopy
- I try to catalog everything I need to install via whatever appropriate
  package manager with `INSTALL: ` lines in my dotfiles
- I try to be very intentional & explicit with my settings. I always forget
  where/why I did something so I leave verbose comments & sources via `source: `
  lines

# Usage
I use GNU stow to manage dotfiles. It is a "symlink farm manager"

This repo mirrors exactly how things should look in my `$HOME / ~/` directory

## Dotfile set up steps:
1.) check out this repo in ~/.dotfiles
2.) run
```bash
cd ~/.dotfiles
stow .
```
which symlinks the files in this repo to the parent directory (`~/`), ignoring
things in `.stow-local-ignore`

## Cleanup steps
```bash
cd ~/.dotfiles
stow -D .
```
deletes symlinks stow created

# Notes
- my current setup is zsh/iterm2/vscode/tmux -> zsh/iterm2/neovim/tmux
- gonna try out switching from vscode to neovim; let's see how it goes

# TODOs
- [ ] figure out installs; stow is one of them
- [ ] figure out how to backup iterm
- [ ] update dotfiles
