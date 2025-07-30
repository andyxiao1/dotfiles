I store all my dotfiles here.

# Install / Sources
INSTALL: [stow] https://formulae.brew.sh/formula/stow  
SOURCE: https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/  
SOURCE: https://www.youtube.com/watch?v=y6XCebnB9gs

# Philosopy
- I try to catalog everything I need to install via whatever appropriate
  package manager with this `INSTALL: ` marker in my dotfiles
- I try to be very intentional & explicit with my settings. I always forget
  where/why I did something so I leave verbose comments & sources via this
  `SOURCE: ` marker
- I have more markers listed below
- I try to use the "XDG Base Directory Specification" stuff whenever I can
  because it feels cleaner. This just means put dotfiles in `~/.config`

# Usage
I use GNU stow to manage dotfiles. It is a "symlink farm manager"

This repo mirrors exactly how things should look in my `$HOME` directory (`~/`)

## Dotfile set up steps
1.) check out this repo in ~/.dotfiles  
2.) run
```bash
cd ~/.dotfiles
# dryrun
stow -nv .

# run for real
stow -v .
```
which symlinks the files in this repo to the parent directory (`~/`), ignoring
things in `.stow-local-ignore`

## Find markers
```bash
cd ~/.dotfiles
rg -i --hidden 'INSTALL: '
rg -i --hidden 'TODO: '
rg -i --hidden 'SOURCE: '
rg -i --hidden 'LEARN: '
# helpful tipes to remember
rg -i --hidden 'REMEMBER: '
```

## Cleanup steps
```bash
cd ~/.dotfiles
stow -Dv .
```
deletes symlinks stow created

# Notes
- my current setup is zsh/iterm2/vscode/tmux -> zsh/iterm2/neovim/tmux
- gonna try out switching from vscode to neovim; let's see how it goes

# Iterm2
iterm2 settings live in iterm2. They aren't synced with the stow dotfiles
because they require manual importing/exporting.

To export
```
General -> Settings -> Export All Settings and Data...
or
Search for "Load settings from a custom folder or URL"
```

# TODOs
- [ ] figure out how to backup iterm
- [ ] flesh out nvim setup
- [ ] learn emacs keybindings in the shell
- [ ] maybe: try emacs later on
- [ ] maybe: try out different terminal emulators (kitty?)
- [ ] maybe: try out different package managers (nix?)
